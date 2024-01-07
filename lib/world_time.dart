import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
 String location = ''; //location name for UI
 String time = ''; // time in that location
 String url= ''; //location url for API end points
 bool isDaytime = false;

  WorldTime({required this.location, required this.url});

  Future <void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);


      DateTime now = DateTime.parse(dateTime);
      now = now.add(
          Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      isDaytime= now.hour >6 && now.hour<15?true:false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time= 'could not get time data';
    }
  }
}

