class NoteModel {
  int? id;
  String? note;
  String? createdAt;
  String? updatedAt;

  NoteModel({this.id, this.note, this.createdAt, this.updatedAt});

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}