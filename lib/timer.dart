import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text("its me timer"),
        ),
      ),
      body: Center(
          child: CircularCountDownTimer(
        duration: 10,
        initialDuration: 0,
        controller: control,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        ringColor: Colors.grey[300],
        ringGradient: null,
        fillColor: Colors.purpleAccent[100],
        fillGradient: null,
        backgroundColor: Colors.transparent,
        backgroundGradient: null,
        strokeWidth: 20.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            fontSize: 33.0, color: Colors.blue, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.S,
        isReverse: false,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          print('Countdown Started');
        },
        onComplete: () {
          print('Countdown Ended');
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          control.pause();
          control.restart();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
