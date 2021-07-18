class Note{
  String textNote;
  
  
  Note({this.textNote});
  
  Note.fromjson(Map<String, dynamic> json):
  textNote = json['note'];

  Map<String, dynamic> toJson() =>{
    'note' : textNote,
  };
}