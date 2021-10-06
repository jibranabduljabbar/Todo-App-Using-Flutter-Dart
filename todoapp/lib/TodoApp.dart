
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<dynamic> lst = ["Break Fast","Food Delivery","Dinner"];
  var Output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Center(
            child: Text("Todo App",
            textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w900),),
          ),
          backgroundColor: Colors.black,
          actions: [
            SizedBox(width: 10,),
            Icon(Icons.more_vert),
            SizedBox(width: 10,),
          ],
        ),
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 20,),
              Container(
                color: Colors.black,
                margin: EdgeInsets.only(top: 5),
                height: 50,
                child: ListTile(
                  trailing: Container(
                    width: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween
                      ,children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Container(height: 60,width: 50,color: Colors.black,child: Center(child: Text("Edit Item",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "cursive"),))),
                                    content: Container(
                    width: 10,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.center,
                      maxLength: 40,
                      decoration: InputDecoration(
                            hintText: "...",
                            prefixIcon: Icon(Icons.update),
                            helperText: "Example: Upgrade Your Item...!",
                            border: OutlineInputBorder()
                      ),
                      onChanged: (val) {
                                        Output = val;
                                      },
                    ),
                  ),
                                    actions: [
              FloatingActionButton(
        onPressed: () {
                                                                   setState(() {
                                            lst.replaceRange(
                                              index,
                                              index + 1,
                                              {Output}
                                            );
                                          });
                                          Navigator.of(context).pop();
   
                                               },child: Icon(
          Icons.update,
        ),
        backgroundColor: Colors.black,)
                                 ],
                                  );
                                });
                          },
                          child: Icon(Icons.edit,color: Colors.white,)),
                      //  SizedBox(width: 2,),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete,color: Colors.white,)),
                      ),
                    ]),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(bottom:7.0),
                    child: CircleAvatar(backgroundImage: AssetImage("assets/Todo.jpg")
                    ,),
                  ),
                  title: Center(child: Text("${lst[index]}",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "cursive",color: Colors.white))),
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: 
                     Container(height: 60,width: 50,color: Colors.black,child: Center(child: Text("Add Item",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "cursive"),))),
                  
                  content: Container(
                    width: 10,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.center,
                      maxLength: 40,
                      decoration: InputDecoration(
                            hintText: "...",
                            prefixIcon: Icon(Icons.receipt_outlined),
                            helperText: "Example: Break Fast...!",
                            border: OutlineInputBorder()
                      ),
  
                      onChanged: (val) {
                        Output = val;
                      },
                    ),
                  ),
                  actions: [
   FloatingActionButton(
        onPressed: () {
                            setState(() {
                          lst.add(Output);
                        });
                        Navigator.of(context).pop();
                                               },child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.black,)
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}