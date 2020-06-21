import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading' ;

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Egypt', flag: 'egypt.png', urlEndpoint: 'Africa/Cairo');
    await instance.getData();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location'  : instance.location,
      'flag'      : instance.flag,
      'time'      : instance.time,
      'dayStatus' :instance.dayStatus
    });
  }

  @override
  void initState(){
    super.initState() ;
    setupWorldTime()  ;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.blue[800],
          size: 80.0,
        ),
      ),
    );
  }

/*child: Card(
  shadowColor: Colors.blue,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0),
  ),
  child: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Text(
  '$time',
  style: TextStyle(
  fontSize: 20.0,
  letterSpacing: 2.0
  ),
  ),
  ),
  ),*/
}
