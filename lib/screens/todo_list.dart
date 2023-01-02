import '../constants/consts.dart';

class TodoList extends StatelessWidget {
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;
  const TodoList(
      {super.key, required this.todo, this.onToDoChange, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            onToDoChange(todo);
            print('Aaiya dukhyoo');
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: bgColor,
          ),
          title: Text(
            todo.todoText,
            style: TextStyle(
              fontSize: 16,
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.underline,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
              print('Ma haraya');
            },
          ),
        ),
      ),
    );
  }
}
