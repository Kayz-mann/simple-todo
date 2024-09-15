import 'package:flutter/material.dart';
import 'package:todos/utils/dialog_box.dart';
import 'package:todos/utils/todo_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List todoList = [
    ["Make Tutorial", false],
    ["Do Excercise", false],
  ];

  final _controller = TextEditingController();

  //checkbox tapped
  void checkBoxChanged(bool value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: () {},
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text('TODO'),
          elevation: 0,
          backgroundColor: Colors.yellow[400],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon((Icons.add)),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxChanged(value ?? false, index),
              deleteFunction: (context) =>
                  deleteTask(index), // Correct function call
            );
          },
        ));
  }
}
