import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data = {};

  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String image = data['isday'] ? 'day.png' : 'night.png';
    return Scaffold(

      backgroundColor: data['isday'] ? Colors.blue : Colors.indigo[800],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$image'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/locations');
                        setState(() {
                          if (result != null) {
                            data = result;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[400],
                        size: 28,
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey[400],
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 27,
                  ),
                  Text(
                    data['location'].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'monospace',
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data['time'].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FlutterAnalogClock(
                    dateTime: data['now'],
                    dialPlateColor: Colors.transparent,
                    hourHandColor: data['isday'] ? Colors.black : Colors.white,
                    minuteHandColor:
                        data['isday'] ? Colors.black : Colors.white,
                    secondHandColor:
                        data['isday'] ? Colors.black : Colors.white,
                    numberColor: Colors.white,
                    borderColor: Colors.white,
                    tickColor: Colors.white,
                    centerPointColor: Colors.amber,
                    showBorder: true,
                    showTicks: false,
                    showMinuteHand: true,
                    showSecondHand: true,
                    showNumber: true,
                    borderWidth: 8.0,
                    hourNumberScale: .10,
                    hourNumbers: [
                      'I',
                      'II',
                      'III',
                      'IV',
                      'V',
                      'VI',
                      'VII',
                      'VIII',
                      'IX',
                      'X',
                      'XI',
                      'XII'
                    ],
                    isLive: true,
                    width: 200.0,
                    height: 200.0,
                    decoration: const BoxDecoration(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
