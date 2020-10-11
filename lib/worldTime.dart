import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String url;
  String location;
  String time;
  String flag;
  bool Isday;
  DateTime now;

  WorldTime({this.location, this.flag, this.url});

  Future<void> send() async {
    try {
      Response res = await get('http://worldtimeapi.org/api/timezone/$url');
      Map json = jsonDecode(res.body);
      String datetime = json['datetime'];
      String offset = json['utc_offset'];
      now = DateTime.parse(datetime);
      now = now.add(
        Duration(
          hours: int.parse(offset.substring(1, 3)),
        ),
      );

      Isday = now.hour > 6 && now.hour < 20 ? true : false;
      print( ' Time Now${now.hour}');
      time = DateFormat.jm().format(now);
    } on SocketException catch (_) {
      print("Error $_");
      time = "Socket Exception";
    } catch (e) {
      time = "Unable To Get Data";
    }
  }
}
