import 'dart:convert';

class Note {
  int id;
  String note;

  Note({
    required this.id,
    required this.note,
  });

  Note copyWith({
    int? id,
    String? note,
  }) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'note': note,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      note: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() => 'Note(id: $id, note: $note)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note && other.id == id && other.note == note;
  }

  @override
  int get hashCode => id.hashCode ^ note.hashCode;
}
