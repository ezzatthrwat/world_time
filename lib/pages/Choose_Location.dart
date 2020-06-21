import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(urlEndpoint: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlEndpoint: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlEndpoint: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlEndpoint: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlEndpoint: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlEndpoint: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlEndpoint: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urlEndpoint: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {
      'location'  : instance.location,
      'flag'      : instance.flag,
      'time'      : instance.time,
      'dayStatus' :instance.dayStatus
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              elevation: 5.0,
              shadowColor: Colors.indigo,
              child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Center(
                    child: Text(locations[index].location ,
                      style: TextStyle(
                          letterSpacing: 5.0,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  )
              ),
            ),
          );
        },
      ),
    );
  }
}
