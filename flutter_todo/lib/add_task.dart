import 'package:flutter/material.dart';
import 'package:flutter_todo/task.dart';
import 'package:flutter_todo/tasks_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var color = Color.fromARGB(255, 218, 216, 216);
  var importance;

  final _nameTaskController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameTaskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? valueChoose;
  List items = ["Not important", "Important", "Very important"];
  @override
  Widget build(BuildContext context) {
    return  Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Add Task"),
            centerTitle: true,
          ),
          body: Form(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nameTaskController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Type your task",
                    prefixIcon: Icon(Icons.edit),
                    hintText: "What should you do",
                  ),
                ),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Description",
                    prefixIcon: Icon(Icons.edit),
                    hintText: "Describe your task",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                
                DropdownButton(
                    value: valueChoose,
                    isExpanded: true,
                    hint: Text("Choose importance"),
                    items: items.map((valueItem) {
                      return DropdownMenuItem(
                        child: Text(valueItem),
                        value: valueItem,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue.toString();
                        print(valueChoose);
                        importance = valueChoose;
                      });
                    }),
                SizedBox(
                  height: 16,
                ),
                Text("Choose color of your task", style: TextStyle(fontSize: 16),),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          color = Colors.red;
                        },
                        color: Colors.red),
                    MaterialButton(
                        onPressed: () {
                          color = Colors.blue;
                        },
                        color: Colors.blue),
                    MaterialButton(
                        onPressed: () {
                          color = Colors.yellow;
                        },
                        color: Colors.yellow),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                 
                    if (_nameTaskController.text == "")
                    {
                        Fluttertoast.showToast(msg: "You did not enter the task",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,);
                    }

                    else{
                     Task task = Task(_nameTaskController.text,
                         _descriptionController.text, color, importance ?? "Not important", false, (p){}, (context){},(context){});
                   
                          

                          Navigator.pop(context,task);
                            
                          
                         
                    } 
                  },
                  color: Colors.green,
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}






