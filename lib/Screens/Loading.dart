import 'package:Test/worldTime.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void GetData() async {
    print('Started');
    WorldTime worldTime =
        WorldTime(location: 'India', url: 'Asia/Kolkata', flag: 'India.jpeg');
    await worldTime.send();
    print('Hour ${worldTime.now.hour}');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'isday': worldTime.Isday,
      'flag':worldTime.flag,
      'time':worldTime.time,
      'now':worldTime.now
    });
  }

  @override
  void initState() {
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SafeArea(
          child: Center(
            child:LoadingFlipping.circle(
              backgroundColor: Colors.white,
              borderColor: Colors.white,
              size: 100.0,
            )
          ),
        ),
      ),
    );
  }
}
