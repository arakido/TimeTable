import 'package:flutter/material.dart';
import 'package:timetable/Note/noteColor.dart';

class NoteReadScreen extends StatefulWidget{
  final dynamic note ;
  NoteReadScreen({super.key, required this.note});

  @override
  State<NoteReadScreen> createState() => _NoteReadScreenState();
}

class _NoteReadScreenState extends State<NoteReadScreen>{
  @override
  Widget build(BuildContext context) {
    int colorId = widget.note['colorId'];
    return Scaffold(
      backgroundColor: NoteColor.cardColor[colorId],
      appBar: AppBar(
        backgroundColor: NoteColor.cardColor[colorId],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.note['title'], style: NoteColor.mainTitle,),
            const SizedBox(height: 4,),
            Text(widget.note['date'], style: NoteColor.dateTitle),
            const SizedBox(height: 4,),
            Text(widget.note['content'], style: NoteColor.mainContent)
          ],
        ),
      ),
    );
  }

}