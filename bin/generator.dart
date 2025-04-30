import 'dart:async';
import 'dart:collection';
// import 'dart:ffi';
// import 'dart:ffi';
import 'package:fixnum/fixnum.dart';
import 'dart:io';
import 'dart:math';
import 'package:xml/xml.dart';
// import 'dart:typed_data';

import 'takproto/takmessage.pb.dart';
import 'takproto/cotevent.pb.dart';
import 'takproto/detail.pb.dart';

class Generator{
List<int> delim = [191,1,191];
int _numPLIs = 12;
double _lat = 0.0;
double _lon = 0.0;
bool _useXML = false;
String _baseName = 'COTGEN';
int _timeout = 30;
String _endpoint = "192.168.4.129:4242:tcp";
// final int maxPins = 13; // max number of PLI's to generate + 1 for loop
Map<String, List<int> > cots = HashMap();
List<String> groups = ["White", "Yellow", "Orange", "Magenta", "Red", "Maroon", "Purple", "Cyan"];
    
  Generator({bool xml = false, int numPLIs = 12, String baseName = 'COTGEN', int timeout = 30, double lat = 36.95, double lon = -77.67, String endpoint = "192.168.4.129:4242:tcp"}) 
  : _useXML = xml, _numPLIs = numPLIs, _baseName = baseName, _timeout = timeout, _lat = lat, _lon = lon, _endpoint = endpoint
  {
    //print('Use XML? $_useXML');
    Timer.periodic(Duration(milliseconds: _timeout * 1000), (timer) {launchCOTs();});    
  }

  /// When a datagram needs to be sent, either for UDP or Multicast, just
  /// launch it to the specified address:port
  void writeDatagram(List<int> data, String address, int port) {
    RawDatagramSocket.bind(InternetAddress.anyIPv4, 0).then((RawDatagramSocket s) {
      // print("UDP MC Send $address:$port");
      s.send(data, InternetAddress(address), port);
    });
  }
  
  void launchCOTs(){
    final ts = "[${DateTime.now().toUtc().toIso8601String()}]";
    stdout.write("$ts Launch CoTs\r");
    loadCOTs();
    cots.forEach((String key, value) {      
      //print("CoT:${delim + value}");
      if(_useXML) {
        writeDatagram(value, "239.2.3.1", 6969);
      }
      else {
        writeDatagram(delim + value, "239.2.3.1", 6969);
      }
      sleep(Duration(milliseconds: 100));
    });
  }
    
  void loadCOTs() {
    for (int j = 1; j < (_numPLIs + 1); ++j) {
        int groupIdx = j % 8; // 0 - 7
        //print("cots:$cots");
        final group = groups[groupIdx];
        final name = "$_baseName$j";
        final tsdt = "${DateTime.now().toUtc().millisecondsSinceEpoch}";
        if(_useXML) {
          cots[name] = makeXML(name, tsdt, group, seq: j).codeUnits;
        }
        else {
          // List<int> blob = makeCOT(name, tsdt, group);
          cots[name] = makeCOT(name, tsdt, group, seq: j);
        }
        // cots[name] = blob;
    }
  }
  
  void on_Send_Now_triggered(){
    launchCOTs();
  }

  String makeXmlTs(int ts, int plusMs) {
    var valms = ts + plusMs;
    var out = DateTime.fromMillisecondsSinceEpoch(valms).toIso8601String();
    return out;
  }

  String makeXML(String uid, String dateTime, String group, {int seq = 1}) {
    /*
<event version="2.0" 
uid="mattermost-user-" 
type="a-f-G-U-C" 
time="2025-04-29T11:44:23.64Z" 
start="2025-04-29T11:44:23.64Z" 
stale="2025-04-29T11:47:53.64Z" 
how="h-g" 
access="Undefined">

    <detail><contact callsign="ROVER" /><__gotenna messageForCallsign="ROVER" messageForUUID="mattermost-user-" /></detail>

    <point lat="36.9515336" lon="-77.6736624" hae="49.7799835205078" ce="9999999" le="9999999" />
    */
    // make an xml string out of the CoT data
    //String out = '<?xml version="1.0" encoding="utf-8" ?>';
    // append the rest of the tags here and
    var ms = int.parse(dateTime);
    var builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('event', nest: () {
      builder.attribute('version', '2.0');
      builder.attribute('uid', uid);
      builder.attribute('type', 'a-f-G-U-C');
      builder.attribute('time', makeXmlTs(ms, 0));
      builder.attribute('start', makeXmlTs(ms, 0));
      builder.attribute('stale', makeXmlTs(ms, 120000));
      builder.attribute('how', 'm-g');
      builder.attribute('access', 'Undefined');
      builder.element('point', nest:  (){
        builder.attribute('lat', '36.95');
        builder.attribute('lon', '-77.67');
        builder.attribute('hae', '49.78');
        builder.attribute('ce', '9999999');
        builder.attribute('le', '9999999');
      });
      builder.element('detail', nest: () {
        builder.element('contact', nest: (){
          builder.attribute('callsign', uid);          
        });
        builder.element('__gotenna', nest: () {
          builder.attribute('messageForCallsign', uid);
          builder.attribute('messageForUUID', uid);
        });
      }); // end <detail>
    });
    
    // return the results
    var out = builder.buildDocument().toXmlString(pretty: false); 
    print("$_endpoint: ${out.substring(out.indexOf('?>') + 2)}");
    return out.substring(out.indexOf('?>') + 2);
  }

  List<int> makeCOT(String uid, String dateTime, String group, {int seq = 1}){
    List<int> out = [];

// use some boilerplate to build a COT with the given uid and time stamp    
    TakMessage t = TakMessage.create(); // a Protobuf Message
    // build the message part by part here
    // t.takControl().setMinProtoVersion(1);
    // t.takControl().setMaxProtoVersion(1);
    // t.takControl().setContactUid(uid);
    double randy = Random.secure().nextInt(9) * 0.003; // int 0 -- 9
    // randy *= 0.003;
    double randyLat = Random.secure().nextInt(9) * 0.003; // int 0 -- 9
    // randyLat *= 0.003;
    double randyHAE = Random.secure().nextInt(99) * 1.0; // int 0 -- 99
    final String role = "Ground Troop";
    // print("randy:$randy");
    var evt = CotEvent(); //cotEvent.createEmptyInstance();    
    evt.type = "a-f-G-u-c";   
    evt.uid = uid;
    evt.hae = randyHAE;
    evt.le = 9999999;
    evt.ce = 9999999;
    if(seq.isOdd) {
        evt.lat = (_lat - randyLat);
    }
    else {
        evt.lat = (_lat + randyLat - 0.022);
    }
    if(seq.isOdd) {
        evt.lon = (_lon - randy + 0.017);
    }
    else {
        evt.lon = (_lon + randy);
    }
    evt.how = "h-e";
    evt.startTime = Int64(int.parse(dateTime));
    var now = DateTime.now().toUtc().millisecondsSinceEpoch;
    evt.sendTime = Int64(now);
    evt.staleTime = Int64(now + 120000); // add 4 min.

    var detail = Detail(); //evt.detail.createEmptyInstance();
    //detail.xmlDetail = "<contact callsign=\"$uid\" endpoint=\"$endpoint\"/><uid Droid=\"$uid\"/><__group name=\"$group\" role=\"$role\"/>";
    detail.setField(1, '<contact callsign="$uid" endpoint="$_endpoint"/><uid Droid="$uid"/><__group name="$group" role="$role"/>');
    evt.setField(15, detail);
    t.setField(2, evt);
    //  print("\n$t");
    
    // then serialize it
    // out = t.serialize(&pbser);
    out = t.writeToBuffer() as List<int>;
    // print("msgout:${out.length}\n\n");
    return out;
  }

}
