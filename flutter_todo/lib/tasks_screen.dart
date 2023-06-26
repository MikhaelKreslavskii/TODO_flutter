

import 'package:flutter/material.dart';
import 'package:flutter_todo/add_task.dart';

import 'package:flutter_todo/edit_task.dart';
import 'package:flutter_todo/task.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskListState();
  }
}

class _TaskListState extends State<TaskList> {



   List toDoList=[];

   @override
   void initState() {
    
    super.initState();
  }

   List doneList= [];
  
 /// late List<Task> tasks;
 /// 
  void checkBoxChanged(bool? value, int index, bool flag)
  {
      setState(() {
       
       if(flag==false)
       {
       
        toDoList.elementAt(index).taskCompleted= !toDoList.elementAt(index).taskCompleted;
        doneList.add(toDoList.elementAt(index));
        toDoList.removeAt(index);
      
       }
         else
        {
        doneList.elementAt(index).taskCompleted= !doneList.elementAt(index).taskCompleted;
        toDoList.add(doneList.elementAt(index));
        doneList.removeAt(index);
        }
        
      });

      
  }



  void deleteTask(int index, bool flag)
  {
    setState(() {
      if(flag==false){
      toDoList.removeAt(index);
      }

      else{
        doneList.removeAt(index);
      }
    });

   //// db.updateData();
  }


  void editTask(int index, bool flag) async
  {
       
    final result = await Navigator.push(context,MaterialPageRoute(builder: (context) =>  EditTask(toDoList.elementAt(index))));
    setState(() {

      if(flag==false)
    {
      if(!mounted) return;

 if(result!= null)
 {
  print(result.runtimeType);
  toDoList.removeAt(index);
  toDoList.insert(index, result);
 }
      
    }
    
  
  
  else
     {
      if(!mounted) return;

 if(result!= null)
 {
  print(result.runtimeType);
  doneList.removeAt(index);
  doneList.insert(index, result);
 }

  }
  });

  ////db.updateData();
  }

  @override
  Widget build(BuildContext context) {
     
   /// tasks.add(task);
    return  Builder(
        builder: (context) {
          return Scaffold(
          
          
            appBar: AppBar(
              title: Text("My tasks"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                
                    children: [
                
                      Text("Current tasks", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 24),textAlign: TextAlign.start,),
                
                      Container(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: toDoList.length,
                          
                          itemBuilder: (BuildContext context, int index) { 
                      
                            // if (toDoList.length<0)
                            // {
                            //   return Text("Type your task");
                            // }
                      
                            return Task(
                              toDoList.elementAt(index).nameTask,
                             toDoList.elementAt(index).description,
                             toDoList.elementAt(index).color,
                             toDoList.elementAt(index).importance, 
                             toDoList.elementAt(index).taskCompleted,
                             (value)=>checkBoxChanged(value, index,false),
                             
                             (context)=>editTask(index, false),
                             (context) =>deleteTask(index,false),
                      
                             );
                           },
                          
                          
                        ),
                      ),
                      Text("Completed tasks", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                            
                      Container(
                        height: 300,
                        child: ListView.builder(
                          itemCount: doneList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index){
                      
                            return Task(
                                doneList.elementAt(index).nameTask,
                               doneList.elementAt(index).description,
                               doneList.elementAt(index).color,
                               doneList.elementAt(index).importance, 
                               doneList.elementAt(index).taskCompleted,
                               (value)=>checkBoxChanged(value, index,true,),
                               
                               (context)=>editTask(index, true),
                               (context) =>deleteTask(index, true),
                        
                               );
                      
                          }),
                      ), 
                            
                    ],
                  ),
                ),
              ),
            
            
           
            floatingActionButton: FloatingActionButton(onPressed: ()
            {
              _returnDataFromAddTask(context);
            },child: Icon(Icons.add,),),
          );
        }
      
    );
  }




  void _returnDataFromAddTask(BuildContext context) async
{
  

 final result = await Navigator.push(context,MaterialPageRoute(builder: (context) => const AddTask()));
 

setState(() {

 
 if(!mounted) return;

 if(result!= null)
 {
  print(result.runtimeType);
toDoList.add(result);
 }
  
  
 ///db.updateData();
  
});


////db.updateData();



}

 

}


