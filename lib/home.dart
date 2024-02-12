import 'package:dailytasklistview/edit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List task = ["Task 1","Task 2","Task 3","Task 4","Task 5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:Icon(Icons.menu
        ,color: Colors.white,) 
        ),
        body: ListView.builder(
          itemCount: task.length,
          itemBuilder: (context, index) {
           return Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
              child: Container(
                height: 60,
                width: 100,
                color: Colors.white,
                child: ListTile(
                  title: Row(
                    children: [
                      Text(task[index],
                      style:TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 15
                      ) ,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 290),
                        child: IconButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Edit(name:task[index]),
                            ));
                        }, icon: Icon(Icons.edit_square)),
                      ),
                      IconButton(onPressed: () {
                        setState(() {
                          task.removeAt(index);
                           Fluttertoast.showToast(msg: 'item deleted');
                        });
                      }, icon: Icon(Icons.delete))
                    ],
                  ),
                  
                ),
                
              ),
            );
          
        }
        ),
    );
  }
}