import 'package:flutter/material.dart';
import 'package:todo/main.dart';

import '../utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ['Learn Next.JS', false],
    [
      'Learn FLutter',
      false,
    ],
    ['Learn React', false]
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    }); // To update the UI with the new state.  // setState() is a method provided by Flutter to update the UI.  // It is a way to trigger a rebuild of the widget tree.  // This is a critical part of Flutter's state management system.  // If you forget to call setState(), the UI will not be updated.  // Without it, the UI will remain unchanged, even when the state changes.  // It's a good practice to always call setState() when you want to update the UI.  // This way, the UI will always reflect the current state of the app.  // In this case, the UI will update the checkbox to reflect the new state of the task.  // setState() will cause the build() method to be called again, and the new UI will be displayed.  // This is how Flutter updates the UI in
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear(); // Clearing the text field after adding a new task.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87, MAIN BG COLOR
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor:
            const Color.fromARGB(255, 163, 210, 248), //HEADER COLOR
        // foregroundColor: Colors.white60, TEXT CHANGE
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller:
                    _controller, //getting users input, upr ik controller function phle create kiye phir yaha call kiye
                decoration: InputDecoration(
                  hintText: "Add New Task",
                  filled: true,
                  fillColor: Colors.blue.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade300),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 101, 127, 148)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            tooltip:
                'Add Task', //jab button pr hover hoga to Add Task show ka buton hai show hoga
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
