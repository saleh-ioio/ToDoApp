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

  Future<NotesList> readToNotesFile() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      print(contents);
      List<dynamic> dynamicJson = jsonDecode(contents);
      NotesList notesInFiless = NotesList.fromJson(dynamicJson);

      print("reading from file ....");

      //    return notesInFile.textNote;
      return notesInFiless;
    } catch (e) {
      // If encountering an error, return 0
      print("cant find file !!!");
      print(e);
      return null;
    }
  }

  Future<File> writeToNotesfile({NotesList saveToJson}) async {
    final file = await _localFile;

    String json = jsonEncode(saveToJson.toJson());
    print(json);

    // Write the file
    return file.writeAsString(json);
  }
}
