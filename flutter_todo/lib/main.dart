import 'package:flutter/material.dart';
import 'package:flutter_todo/tasks_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';




void main()  {

  
  runApp(
    
   
    
     const MaterialApp(
    title: "First screen",
    home: TaskList(),
  ));
}

