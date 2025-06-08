import 'dart:async';
import 'dart:collection';
import 'package:fixnum/fixnum.dart';
import 'dart:io';
import 'dart:math';
import 'package:xml/xml.dart';

import 'takproto/takmessage.pb.dart';
import 'takproto/cotevent.pb.dart';
import 'takproto/detail.pb.dart';

class Generator{
final List<int> delim = [191,1,191];
final List<int> xmlheader = '<?xml version="1.0"?>'.codeUnits;
int _numPLIs =  6;
bool _useXML = false;
double _lat = 0.0;
double _lon = 0.0;
String _baseName = 'COTGEN';
int _timeout = 30;
String _endpoint = "192.168.4.129:4242:tcp";
String addr = '239.2.3.1';
int port = 6969;
// final int maxPins = 13; // max number of PLI's to generate + 1 for loop
Map<String, List<int> > cots = HashMap();
List<String> groups = ["White", "Yellow", "Orange", "Magenta", "Red", "Maroon", "Purple", "Dark_Blue", "Blue", "Cyan", "Teal", "Green", "Dark_Green", "Brown"];
    
  Generator({bool xml = false, int numPLIs = 12, String baseName = 'COTGEN', int timeout = 30, double lat = 36.95, double lon = -77.67, String endpoint = "192.168.4.129:4242:tcp", String addr = '239.2.3.1', int port = 6969}) 
  : _useXML = xml, _numPLIs = numPLIs, _baseName = baseName, _timeout = timeout, _lat = lat, _lon = lon, _endpoint = endpoint
  {
    //print('Use XML? $_useXML');
    Timer.periodic(Duration(seconds: _timeout), (timer) {launchCOTs();});    
  }

  /// When a datagram needs to be sent, either for UDP or Multicast, just
  /// launch it to the specified address:port
  void writeDatagram(List<int> data, String address, int port) {
    RawDatagramSocket.bind(InternetAddress.anyIPv4, 0).then((RawDatagramSocket s) {
      // print("UDP MC Send $address:$port");
      s.multicastHops = 64;
      s.multicastLoopback = true;      
      s.send(data, InternetAddress(address), port);
      s.writeEventsEnabled = true;
    });
  }
  
  void launchCOTs({String addr = '239.2.3.1', int port = 6969}){
    //final ts = "[${DateTime.now().toUtc().toIso8601String()}]";
    //stdout.write("$ts Launch CoTs\n");
    loadCOTs();
    cots.forEach((String key, value) {                  
      if(_useXML) {
        print("CoT:${String.fromCharCodes(value)}");
        writeDatagram(xmlheader + value, addr, port);
      }
      else {
        print("CoT:${String.fromCharCodes(delim + value)}");
        writeDatagram(delim + value, addr, port);
      }
      sleep(Duration(milliseconds: 100));
    });
  }
    
  void loadCOTs() {
    final int numplis = _numPLIs + 1;
    for (int j = 1; j < numplis; ++j) {
        int groupIdx = j % 14; // 0 - 13
        //print("cots:$cots");
        final group = groups[groupIdx];
        final name = "$_baseName$j";
        final tsdt = "${DateTime.now().toUtc().millisecondsSinceEpoch}";
        if(_useXML) {
          cots[name] = makeXMLCoT(name, tsdt, group, seq: j).codeUnits;
        }
        else {
          // List<int> blob = makeCOT(name, tsdt, group);
          cots[name] = makePbCoT(name, tsdt, group, seq: j);
        }
        // cots[name] = blob;
    }
  }

  String makeGtUid(int seq) {
    // should be ANDROID- followed by 8 hex bytes (16 chars)
    if(seq < 10) {
      print('ANDROID-abcdefabcdef123$seq');
      return 'ANDROID-abcdefabcdef123$seq';
    }
    else {
      var out = 'ANDROID-abcdefabcdef123';
      var sseq = '$seq';
      out = out.substring(0, 16 - sseq.length);
      print ('makeGtUid: $out$sseq');
      return '$out$sseq';
    }    
  }
 
  String makeXmlTs(int ts, int plusMs) {
    var valms = ts + plusMs;
    var out = DateTime.fromMillisecondsSinceEpoch(valms).toIso8601String();
    return "${out}Z";
  }

  String makeXMLCoT(String uid, String dateTime, String group, {int seq = 1}) {
    /*
<event version="2.0" uid="ANDROID-67203c5be92eab85" type="a-f-G-U-C" time="2025-06-08T17:20:41.528Z" start="2025-06-08T17:20:41.528Z" stale="2025-06-08T17:22:26.528Z" how="h-g">
<point lat="36.9509972" lon="-77.6722649" hae="45.3619270324707" ce="9999999.0" le="9999999.0"/>
<detail>
<contact callsign="MARMADUKE" endpoint="0.0.0.0:4242:tcp"/>
<__gotenna messageForCallsign="MARMADUKE" messageForUUID="ANDROID-67203c5be92eab85"/>
<__group name="Purple" role="Team Member"/>
<uid Droid="MARMADUKE"/>
</detail>
</event>

    */
    //print('Make and XML CoT: seq: $seq');    
    // make an xml string out of the CoT data
    //String out = '<?xml version="1.0" encoding="utf-8" ?>';
    // append the rest of the tags here and
    // final String faketakv = '<takv ';
    var uidstr = makeGtUid(seq);
    final int ms = int.parse(dateTime);
    var builder = XmlBuilder();
    final double randy = Random.secure().nextInt(9) * 0.003; // int 0 -- 9
    // randy *= 0.003;
    final double randyLat = Random.secure().nextInt(9) * 0.003; // int 0 -- 9
    // randyLat *= 0.003;
    final double randyHAE = Random.secure().nextInt(99) * 1.0; // int 0 -- 99
    var lat = 0.0;
    var lon = 0.0;
    if(seq.isOdd) {
        lat = (_lat - randyLat);
    }
    else {
        lat = (_lat + randyLat - 0.022);
    }
    if(seq.isOdd) {
        lon = (_lon - randy + 0.017);
    }
    else {
        lon = (_lon + randy);
    }
    final String role = "Ground Troop";
    builder.processing('xml', 'version="1.0"');
    builder.element('event', nest: () {
      builder.attribute('version', '2.0');
      builder.attribute('uid', uidstr);
      builder.attribute('type', 'a-f-G-U-C');
      builder.attribute('time', makeXmlTs(ms, 0));
      builder.attribute('start', makeXmlTs(ms, 0));
      builder.attribute('stale', makeXmlTs(ms, 120000));
      builder.attribute('how', 'm-g');
      builder.attribute('access', 'Undefined');
      builder.element('point', nest:  (){
        builder.attribute('lat', lat);
        builder.attribute('lon', lon);
        builder.attribute('hae', randyHAE);
        builder.attribute('ce', '9999999');
        builder.attribute('le', '9999999');
      });
      builder.element('detail', nest: () {
        builder.element('uid', nest:() {
          builder.attribute('Droid', uid);
        });
        // builder.element('takv', nest: (){
        //   builder.attribute('device', 'x');
        //   builder.attribute('platform', 'ATAK');
        //   builder.attribute('os', 'Android');
        //   builder.attribute('version', '30');
        // });
        builder.element('contact', nest: (){
          builder.attribute('callsign', uid);       
          builder.attribute('endpoint', '192.168.53.224:4242:tcp');   
        });
        builder.element('__group', nest: () {
          builder.attribute('role', role);
          builder.attribute('name', group);
        });
        builder.element('__gotenna', nest: () {
          builder.attribute('messageForCallsign', uid);
          builder.attribute('messageForUUID', uidstr);
        });
      }); // end <detail>
    });
    
    // return the results
    var out = builder.buildDocument().toXmlString(pretty: false); 
    print("$_endpoint: ${out.substring(out.indexOf('?>') + 2)}");
    return out.substring(out.indexOf('?>') + 2);
  }

  List<int> makePbCoT(String uid, String dateTime, String group, {int seq = 1}){
    List<int> out = [];
// use some boilerplate to build a COT with the given uid and time stamp    
    TakMessage t = TakMessage.create(); // a Protobuf Message
    // build the message part by part here
    // t.takControl().setMinProtoVersion(1);
    // t.takControl().setMaxProtoVersion(1);
    // t.takControl().setContactUid(uid);
    final double randy = Random.secure().nextInt(9) * 0.003; // int 0 -- 9
    // randy *= 0.003;
    final double randyLat = Random.secure().nextInt(9) * 0.003; // int 0 -- 9
    // randyLat *= 0.003;
    final double randyHAE = Random.secure().nextInt(99) * 1.0; // int 0 -- 99
    final String role = "Ground Troop";
    // print("randy:$randy");
    var evt = CotEvent(); //cotEvent.createEmptyInstance();    
    evt.type = "a-f-G-U-C";   
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
