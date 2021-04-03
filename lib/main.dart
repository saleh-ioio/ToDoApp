import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ToDo app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;


  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  var notes = List<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addNoteT(String cat) {
    setState(() {
      notes.add(cat);
    });
  }

  void _removeTodoItem(int index) {
    setState(() => notes.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Mark "${notes[index]}" as done?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()
                ),
                new FlatButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    }
                )
              ]
          );
        }
    );
  }

  Widget note(String text, int index){

    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: InkWell(
                onTap: () {
                  _promptRemoveTodoItem(index);
                  print("tapped");
                },
                borderRadius: BorderRadius.all(Radius.circular(20)),
                splashColor: Colors.cyanAccent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Icon(
                          Icons.alarm,
                          color: Colors.green,
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          text,
                          style: TextStyle(color: Colors.green),
                        ))
                  ],
                ))));

  }

  void _pushAddTodoScreen() {
    // Push this page onto the stack
    Navigator.of(context).push(
      // MaterialPageRoute will automatically animate the screen entry, as well
      // as adding a back button to close it
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(title: new Text('Add a new task')),
            body: Center(
              child: new TextField(
                autofocus: true,
                onSubmitted: (val) {
                  addNoteT(val);
                  Navigator.pop(context); // Close the add todo screen
                },
                decoration: new InputDecoration(
                    hintText: 'Enter something to do...',
                    contentPadding: const EdgeInsets.all(16.0)),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: new ListView.builder(
        itemCount: notes.length,
        itemBuilder: (
          BuildContext ctxt,
          int index,
        ) {
          return note(
             notes[index],
            index,

          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _pushAddTodoScreen,
      ),
    );
  }
}


/*class note extends StatelessWidget {
  final String text;
  final int index;

  note({Key key, @required this.text, @required this.index})
      : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: InkWell(
                onTap: () {

                  print("tapped");
                },
                borderRadius: BorderRadius.all(Radius.circular(20)),
                splashColor: Colors.cyanAccent,
                highlightColor: Colors.transparent,
                child: Row(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Icon(
                          Icons.alarm,
                          color: Colors.green,
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          text,
                          style: TextStyle(color: Colors.green),
                        ))
                  ],
                ))));
    // TODO: implement build
  }
}
*/