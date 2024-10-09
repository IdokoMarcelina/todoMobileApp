

import 'package:flutter/material.dart';
import 'package:todo/utilities/dialog_box.dart';
import 'package:todo/utilities/todo_tile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();
  List toDoList = [
    ["Do my chores", false],
    ["Have my bath", false]
  ];


  void checkBoxChanged(bool? value, int index){

      setState(() {
        toDoList[index][1]=!toDoList[index][1];
      });

  }

  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(controller: _controller,
          onSave: saveNewTask,
          onCancel: ()=> Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index){
    toDoList.removeAt(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("To-Do App", style:
        TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
          onPressed: createNewTask,
          child: Icon(Icons.add),),

      body:ListView.builder(
          itemCount: toDoList.length,
        itemBuilder: (context,index){
            return TodoTile(taskName: toDoList[index][0],
                            taskCompleted: toDoList[index][1],
                            onChanged: (value ) => checkBoxChanged(value, index), deleteFunction: (context ) => deleteTask(index) ,);
        },
      ),
    );
  }
}
