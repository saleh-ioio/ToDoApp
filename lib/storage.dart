import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'note.dart';
import 'package:path_provider/path_provider.dart';

class NotesStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(_localPath);
    return File('$path/Notes.json');
  }

  Future<String> readToNotesFile() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      Map<String, dynamic> userMap = jsonDecode(contents);
      Note notesInFile = Note.fromjson(userMap);

      print("reading from file ....");

      return notesInFile.textNote;
    } catch (e) {
      // If encountering an error, return 0
      print("cant find file !!!");
      print(e);
      return "error cant find file";
    }
  }

  Future<File> writeToNotesfile({Map<String, dynamic> saveToJson}) async {
    final file = await _localFile;
    
    String json = jsonEncode(saveToJson);

    // Write the file
    return file.writeAsString(json);
  }
}
