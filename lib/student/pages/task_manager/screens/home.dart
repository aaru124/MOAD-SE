import 'package:flutter/material.dart';
import 'package:flutter_application_1/student/pages/feed/view/pages/post_page.dart';
import 'package:flutter_application_1/student/pages/task_manager/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../student_main.dart';
import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  final String user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPref sharedPref = SharedPref();
  /*List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(
        id: '03',
        todoText: 'Check Emails',
      ),
      ToDo(
        id: '04',
        todoText: 'Team Meeting',
      ),
      ToDo(
        id: '05',
        todoText: 'Work on mobile app',
      ),
    ];*/

  void makeTask(Map<String, dynamic> data) {
    for (int i = 0; i < data['task'].length; i++) {
      ToDo a = ToDo(
          id: data['task']["task-${i + 1}"]["id"],
          todoText: data['task']["task-${i + 1}"]["text"],
          isDone: data['task']["task-${i + 1}"]["isDone"]);
      todosList.add(a);
    }
  }

  late String user;
  List<ToDo> todosList = [];
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    user = widget.user;
    _foundToDo = todosList;
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    Future<DocumentSnapshot<Map<String, dynamic>>> user_list =
      FirebaseFirestore.instance.collection('users').doc(user).get();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(user).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("snapshot has error");
          }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/oops.png",
                          height: 150,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "You have not appeared in this exam yet!",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              makeTask(data);
              return Scaffold(
                backgroundColor: tdBGColor,
                appBar: _buildAppBar(),
                body: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Column(
                        children: [
                          searchBox(),
                          Expanded(
                            child: ListView(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 50,
                                    bottom: 20,
                                  ),
                                  child: Text(
                                    'Task Manager',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                for (ToDo todoo in _foundToDo.reversed)
                                  ToDoItem(
                                    todo: todoo,
                                    onToDoChanged: _handleToDoChange,
                                    onDeleteItem: _deleteToDoItem,
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              right: 20,
                              left: 20,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: _todoController,
                              decoration: InputDecoration(
                                  hintText: 'Add a new todo item',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                          ),
                          child: ElevatedButton(
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                            onPressed: () {
                              _addToDoItem(_todoController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: tdBlue,
                              minimumSize: Size(60, 60),
                              elevation: 10,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            
            
          }
          return Text("");
  });
  }

  
   Future<void> addApp( Map<String, dynamic> data) {
    // Calling the collection to add a new user
    return FirebaseFirestore.instance.collection('users').doc(user)
        //adding to firebase collection
        .update(data)
        .then((value) => print(""))
        .catchError((error) => print("Event couldn't be added."));
  }

  void _handleToDoChange(ToDo todo) async{
    final event_list = await FirebaseFirestore.instance.collection('users').doc(user).get();
    final data = event_list.data()!;
    data["task"]["task-${todo.id}"]["isDone"]=!todo.isDone;
    addApp(data);
    setState(() {
      
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBGColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        user: user,
                      ))),
        ));
  }
}
