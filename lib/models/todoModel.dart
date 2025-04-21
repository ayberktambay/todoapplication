class ToDoListModel {
  int? id;
  String? title;
  bool? isCompleted;
  ToDoListModel({this.id, this.title, this.isCompleted = false});
   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      "isCompleted": isCompleted,
    };
  }
}

class ListModel{
  int? id;
  String? name;
  String? description;
  ListModel({this.id, this.name, this.description});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      "description": description,
    };
    }

  
}