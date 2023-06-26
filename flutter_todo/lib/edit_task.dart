import 'package:flutter/material.dart';
import 'package:flutter_todo/task.dart';
import 'package:flutter_todo/tasks_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';


class EditTask extends StatefulWidget {
   Task task;
   
EditTask(this.task)
{
  
  print(task.nameTask);
  print(task.description);
  print(task.importance);
  
}



  @override
  State<EditTask> createState() => _EditTaskState(task.color, task.importance);
}

class _EditTaskState extends State<EditTask> {
  var color;
  var importance;

  final _nameTaskController = TextEditingController();
  final _descriptionController = TextEditingController();

  _EditTaskState(this.color,this.importance);

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
        var task;
        return Scaffold(
          appBar: AppBar(
            title: Text("Edit Task"),
            centerTitle: true,
          ),
          body: Form(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nameTaskController..text=widget.task.nameTask,
                  
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Enter your task name",
                    prefixIcon: Icon(Icons.edit),
                   
                  ),
                ),
                TextFormField(
                  controller: _descriptionController..text=widget.task.description,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: "Type your description",
                    prefixIcon: Icon(Icons.edit),
                    
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Choose importance of your task"),
                DropdownButton(
                    value: valueChoose,
                    isExpanded: true,
                    hint: Text("${widget.task.importance}"),
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
                Text("Choose your color"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          
                          color = Colors.red;
                        },
                        color: Colors.red,
                        ),
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
                     Task taskedit = Task(_nameTaskController.text,
                         _descriptionController.text, color, importance ?? "Not important", false, (p){}, (context){},(context){});
                    
                          

                          Navigator.pop(context,taskedit);
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






