import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: timerPage(),
    );
  }
}

class timerPage extends StatefulWidget {
  double progressingTime = 0.6;
 
  timerPage({
    Key key,
  }) : super(key: key);
  @override
  _timerPageState createState() => _timerPageState();
}

class _timerPageState extends State<timerPage> {
  CountDownController control = new CountDownController();
  double counterValue = 11;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(
            "its me timer",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Center(
          child: CircularPercentIndicator(
              radius: 150,
              circularStrokeCap: CircularStrokeCap.round,
              lineWidth: 20.0,
              percent: 0.3,
              center: new Text("100%"),
              progressColor: Colors.green),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Stopwatch().start();  
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
