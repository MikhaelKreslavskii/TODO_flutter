import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Task extends StatelessWidget {
  String nameTask;
   String description;
  var  color;
   String importance;

  bool taskCompleted;
 Function(bool?)? onChanged;

 Function(BuildContext)? deleteTask;
 Function(BuildContext)? editTask;
  var color1=Colors.transparent;
  Task(this.nameTask, this.description, this.color, this.importance, this.taskCompleted, this.onChanged,this.editTask, this.deleteTask);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Slidable(


        endActionPane: ActionPane(
        motion: StretchMotion(), 
        
        children: [

           SlidableAction(onPressed: editTask, 
          icon: Icons.edit,
          backgroundColor: Colors.green,
          borderRadius: BorderRadius.circular(12)),

          SlidableAction(onPressed: deleteTask, 
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(12),),
         
        ]
        
      ),
      child: Container(
         ///margin: EdgeInsets.all(8),
         padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
             //// mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nameTask, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
                Text(description, style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16),),
                Text(importance, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              ],
                
            ),
            
            Transform.scale(
              scale: 1.5,
              child: Checkbox(value: taskCompleted, onChanged: onChanged,splashRadius: 24,)),
          ],
        ),
    
    
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
    
      ),
    ),
    );
  }
}