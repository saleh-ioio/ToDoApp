class Note {
  String textNote;

  Note({this.textNote});

  Note.fromjson(Map<String, dynamic> json) : textNote = json['note'];

  Map<String, dynamic> toJson() => {
        'note': textNote,
      };
}

class NotesList {
  final List<Note> NoteList;

  NotesList({
    this.NoteList,
  });

  factory NotesList.fromJson(List<dynamic> parsedJson) {
    List<Note> notes = new List<Note>();
    notes = parsedJson.map((i) => Note.fromjson(i)).toList();

    return new NotesList(
      NoteList: notes,
    );
  }

  List<Note> toJson() => NoteList;
}
