import 'package:flutter/material.dart';
import 'package:timetable/Data/weekDataContainer.dart';
import 'package:timetable/Note/noteColor.dart';
import 'package:timetable/Schedule/courseDialog.dart';
import 'package:timetable/Schedule/weekCard.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() {
    return _ScheduleState();
  }
}

class _ScheduleState extends State<Schedule> {
  WeekDataContainer weekData = WeekDataContainer();

  @override
  void initState() {
    weekData.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekData.length,
          itemBuilder: (context, index){
            List data = weekData.getData(index);
            return WeekCard(data: data, index: index, onTap: (node)=>{changeCourse(context, node)},);
          },
        ),
      ),
    );
  }

  void changeCourse(BuildContext context, List node){
    showDialog(context: context, builder: (context){
      return CourseDialog(data: node, onSave: saveCourse, onCancel: cancelSave,);
    });
  }

  void saveCourse(){
    setState(() {
      weekData.updateData();
    });
    Navigator.of(context).pop();
  }

  void cancelSave(){
    setState(() {
      weekData.updateData();
    });
    Navigator.of(context).pop();
  }
}