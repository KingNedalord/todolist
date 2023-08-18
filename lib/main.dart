import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/tasks.dart';

import 'main_page.dart';
late Box box;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TasksAdapter());
  box = await Hive.openBox("tasks");
  runApp(MaterialApp(home: Main_Page(),debugShowCheckedModeBanner: false,));
}

