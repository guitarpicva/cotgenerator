import 'dart:async';
import 'dart:collection';
// import 'dart:ffi';
// import 'dart:ffi';
import 'package:fixnum/fixnum.dart';
import 'dart:io';
import 'dart:math';
// import 'dart:typed_data';

import 'takproto/takmessage.pb.dart';
import 'takproto/cotevent.pb.dart';
import 'takproto/detail.pb.dart';

class Generator{
List<int> delim = [191,1,191];
int _numPLIs = 12;
String _baseName = 'COTGEN';
String endpoint = "192.168.4.129:4242:tcp";
final int maxPins = 13; // max number of PLI's to generate + 1 for loop
Map<String, List<int> > cots = HashMap();
List<String> groups = ["White", "Yellow", "Orange", "Magenta", "Red", "Maroon", "Purple", "Cyan"];
    
  Generator({int numPLIs = 12, String baseName = 'COTGEN'}) 
  : _numPLIs = numPLIs, _baseName = baseName
  {
    Timer.periodic(Duration(milliseconds: 30000), (timer) {launchCOTs();});    
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
    loadCOTs();
    cots.forEach((String key, value) {
      //print("$key:${value.length}");
      // print("Delim:${delim + value}");
      writeDatagram(delim + value, "239.2.3.1", 6969);
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
        List<int> blob = makeCOT(name, tsdt, group);
        cots[name] = blob;
    }
  }
  
  void on_Send_Now_triggered(){
    launchCOTs();
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
        evt.lat = (36.95 - randyLat);
    }
    else {
        evt.lat = (36.95 + randyLat - 0.022);
    }
    if(seq.isOdd) {
        evt.lon = (-77.67 - randy + 0.017);
    }
    else {
        evt.lon = (-77.67 + randy);
    }
    evt.how = "h-e";
    evt.startTime = Int64(int.parse(dateTime));
    var now = DateTime.now().toUtc().millisecondsSinceEpoch;
    evt.sendTime = Int64(now);
    evt.staleTime = Int64(now + 120000); // add 4 min.

    var detail = Detail(); //evt.detail.createEmptyInstance();
    //detail.xmlDetail = "<contact callsign=\"$uid\" endpoint=\"$endpoint\"/><uid Droid=\"$uid\"/><__group name=\"$group\" role=\"$role\"/>";
    detail.setField(1, '<contact callsign="$uid" endpoint="$endpoint"/><uid Droid="$uid"/><__group name="$group" role="$role"/>');
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
