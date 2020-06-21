import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments ;

    String dayStatus = data['dayStatus'] ? 'day.png' : 'night.png' ;
    Color dayColor = data['dayStatus'] ? Colors.blue : Colors.indigo[700] ;

    return Scaffold(
      backgroundColor: dayColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$dayStatus'),
                    fit: BoxFit.cover
                )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: [
                  FlatButton.icon(
                    onPressed: () async {
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data = {
                           'location': result['location'],
                           'flag': result['flag'],
                           'time': result['time'],
                           'dayStatus': result['dayStatus']
                         };
                       });
                    },
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
