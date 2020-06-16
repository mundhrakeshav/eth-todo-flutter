import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/TodoList.dart';
import 'package:todolist/TodoListModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoListModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: TodoList(),
      ),
    );
  }
}
