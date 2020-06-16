import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/TodoListModel.dart';

class TodoList extends StatelessWidget {
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var listModel = Provider.of<TodoListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOLIST"),
      ),
      body: listModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: listModel.taskCount,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(listModel.todos[index].taskName),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: t1,
                          ),
                          flex: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: RaisedButton(
                              onPressed: () {
                                listModel.addTask(t1.text);
                                t1.clear();
                              },
                              child: Text("ADD"),
                            ))
                      ],
                    )),
              ],
            ),
    );
  }
}
