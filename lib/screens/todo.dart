// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../constants/consts.dart';

class ToDo {
  String id;
  String todoText;
  bool isDone = false;
  ToDo({
    required this.id,
    required this.todoText,
    required this.isDone,
  });
  static List<ToDo> todoList() {
    return [
      ToDo(id: "1", isDone: true, todoText: 'Sandesh'),
      ToDo(id: "2", isDone: false, todoText: 'Sandesh'),
      ToDo(id: "3", isDone: false, todoText: 'Sandesh'),
      ToDo(id: "4", isDone: true, todoText: 'Sandesh'),
    ];
  }
}
