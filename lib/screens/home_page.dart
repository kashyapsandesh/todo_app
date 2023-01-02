import 'package:todo_app/screens/todo_list.dart';

import '../constants/consts.dart';
import '../screens/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todoList();
  final _textController = TextEditingController();
  List<ToDo> _foundToDo = [];
  @override
  void initState() {
    super.initState();
    _foundToDo = todosList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: iconColor,
            ),
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                'images/merophoto.jpg',
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                search(),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            'All Todo',
                            style: TextStyle(
                                color: iconColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      for (ToDo todoos in _foundToDo)
                        TodoList(
                          todo: todoos,
                          onToDoChange: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Add a new todo List',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _addItemList(_textController.text);
                      },
                      child: Text('+'),
                    ),
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _runFilter(String enteringtext) {
    List<ToDo> result = [];
    if (enteringtext.isEmpty) {
      result = todosList;
    } else {
      result = todosList
          .where((item) =>
              item.todoText.toLowerCase().contains(enteringtext.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
    });
  }

  void _addItemList(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
        isDone: false,
      ));
      _textController.clear();
    });
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  Widget search() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                focusColor: Colors.red,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ))),
      ),
    );
  }
}
