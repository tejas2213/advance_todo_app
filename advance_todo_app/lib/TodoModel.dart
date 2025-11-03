
class TodoModel{
  int? id;
  String title;
  String description;
  String date;

  TodoModel({this.id, required this.title, required this.description, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
    );
  }
}

