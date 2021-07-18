import 'dart:convert';
import 'storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'timer.dart';
import 'note.dart';


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
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ToDo app', notesStorage: NotesStorage(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final NotesStorage notesStorage ;

  MyHomePage({Key key, this.title, this.notesStorage}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  var notes = List<String>();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();  
    widget.notesStorage.readToNotesFile().then((String value) {
      setState(() {
              notes.add(value);
            });
    });

  }

  void addNoteT(String text) {
    setState(() {
      notes.add(text);
      Note saveNote = Note(textNote: notes[0]);
      widget.notesStorage.writeToNotesfile(saveToJson: saveNote.toJson());
      /*
      Note saveNote =Note(textNote: notes[0] );
      writeNotes( saveJsonNotes: saveNote.toJson());
*/
      
    });
  }

  void _removeTodoItem(int index) {
    setState(() { 
      notes.removeAt(index);
      Note saveNote = Note(textNote: notes[0]);
      widget.notesStorage.writeToNotesfile(saveToJson: saveNote.toJson());
 
    });
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
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  Widget note(String text, int index) {
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


