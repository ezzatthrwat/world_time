import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location ;
  String time ;
  String flag ;
  String urlEndpoint ;
  bool dayStatus ;

  WorldTime({this.location, this.flag, this.urlEndpoint});

  Future<void> getData() async {

    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$urlEndpoint');
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));
      dayStatus = now.hour > 6 && now.hour < 20 ? true : false ;

      time = DateFormat.jm().format(now);
    } catch(e) {
      print('caught error : $e');
      time = 'could not get time date' ;
    }
  }

}
