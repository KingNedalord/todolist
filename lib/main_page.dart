import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/tasks.dart';

import 'main.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({super.key});

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  TextEditingController titleController = TextEditingController();
  TextEditingController comController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, value, child) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(box.getAt(index).title),
                        subtitle: Text(box.getAt(index).comment),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text(
                                          textAlign: TextAlign.center,
                                          "Attention!"),
                                      content: Text(
                                          "Do u really want to delete it?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel")),
                                        TextButton(
                                            onPressed: () {
                                              box.delete(index);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Yes")),
                                      ]);
                                });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                    itemCount: box.length,
                  );
                }),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("New task"),
                        content: Container(
                          width: 150,
                          height: 150,
                          child: Column(
                            children: [
                              TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter title"),
                              ),
                              TextField(
                                controller: comController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter comment"),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close")),
                          TextButton(
                              onPressed: () {
                                if (titleController.text != "" &&
                                    comController.text != "") {
                                  Tasks tasks = Tasks(
                                      title: titleController.text,
                                      comment: comController.text);
                                  box.add(tasks);
                                  Navigator.pop(context);
                                }
                              },
                              child: Text("Add")),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
