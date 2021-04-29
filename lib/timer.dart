import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  timerPage({Key key,}) : super(key: key);
  @override
  _timerPageState createState() => _timerPageState();
}

class _timerPageState extends State<timerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(
          "its me timer" 
          ),
        ),
      ),
      body:Text("timer")
      ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        
      ),
    );

  }
}
