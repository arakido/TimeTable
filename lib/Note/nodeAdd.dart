import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timetable/Note/noteColor.dart';

class NoteAddScreen extends StatefulWidget{
  final Function(Map<String, dynamic>) onAdd;
  const NoteAddScreen({super.key, required this.onAdd});

  @override
  State<StatefulWidget> createState() {
    return _NoteAddScreenState();
  }
}

class _NoteAddScreenState extends State<NoteAddScreen>{
  @override
  Widget build(BuildContext context) {
    int colorId = Random().nextInt(NoteColor.cardColor.length);
    String date = DateTime.now().toString();
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: NoteColor.cardColor[colorId],
        elevation: 0,
        title: const Text('New Note', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: NoteColor.accentColor,
        onPressed: (){
          Map<String, dynamic> data = {
            "title": titleController.text,
            "date": date,
            "content": contentController.text,
            "colorId": colorId};
          widget.onAdd(data);
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
      backgroundColor: NoteColor.cardColor[colorId],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: NoteColor.mainTitle,
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
                hintStyle: NoteColor.mainTitle,
              ),
            ),
            const SizedBox(height: 8,),
            Text(date, style: NoteColor.dateTitle,),
            const SizedBox(height: 28,),
            TextField(
              style: NoteColor.mainContent,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: contentController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Content',
                hintStyle: NoteColor.mainContent,
              ),
            )
          ],
        ),
      ),
    );
  }

}