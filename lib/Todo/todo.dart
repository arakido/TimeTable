import 'package:flutter/material.dart';
import 'package:timetable/Data/dataContainer.dart';
import 'package:timetable/Data/todoDataContainer.dart';
import 'package:timetable/Todo/todoDialog.dart';
import 'package:timetable/Todo/todoCard.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<Todo> {
  final _controller = TextEditingController();

  DataContainer todoData = TodoDataContainer();

  @override
  void initState() {
    todoData.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF21409A),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoData.length,
        itemBuilder: (context, index){
          final data = todoData.getData(index);
          return TodoCard(
              taskName: data[0],
              taskComplete: data[1],
              onChanged: (value) => checkboxChanged(value, index),
              deleteFunction: (_) => deleteTask(index)
          );
        },
      )
    );
  }

  void checkboxChanged(bool? value, int index){
    setState(() {
      final data = todoData.getData(index);
      data[1] = !data[1];
    });
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
      return TodoDialog(controller: _controller, onSave: saveNewTask, onCancel: cancelSave,);
    });
  }

  void saveNewTask(){
    setState(() {
      todoData.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void cancelSave(){
    Navigator.of(context).pop();
  }

  void deleteTask(int index){
    setState(() {
      todoData.remove(index);
    });
  }
}
