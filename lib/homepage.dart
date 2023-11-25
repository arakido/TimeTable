import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:timetable/Schedule/schedule.dart';
import 'package:timetable/Todo/todo.dart';
import 'Note/notes.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;
  
  final List<Widget> _widgetOption = <Widget>[
    const Notes(),
    const Schedule(),
    const Todo(),
  ];

  final List<String> _widgetNames = <String>[
    'Notes',
    'Schedule',
    'Todo List',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF21409A),
        animationDuration: const Duration(microseconds: 300),
        onTap: onItemTap,
        items: [
          Image.asset('assets/note.png', height: 35, width: 35,),
          Image.asset('assets/schedule.png', height: 30, width: 30,),
          Image.asset('assets/check.png', height: 30, width: 30,)
        ],
      ),
      appBar: AppBar(
        elevation: 1.5,   //阴影
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(_widgetNames.elementAt(_selectedIndex), style: const TextStyle(color: Color(0xFF21409A))),
        leading: Container(
          padding: const EdgeInsets.all(4),
          child: ClipOval(child:Image.asset('assets/head.png')),
        ),
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
    );
  }

  void onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}