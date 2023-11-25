import 'package:flutter/material.dart';
import 'package:timetable/Data/noteDataContainer.dart';
import 'package:timetable/Note/nodeAdd.dart';
import 'package:timetable/Note/noteCard.dart';
import 'package:timetable/Note/noteRead.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  NoteDataContainer noteData = NoteDataContainer();

  @override
  void initState() {
    noteData.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => NoteAddScreen(onAdd: addNote,)));
        },
        child: const Icon(Icons.add),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5),
        itemCount: noteData.length,
        itemBuilder: (context, index) {
          final note = noteData.getData(index);
          return noteCard(note, () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=> NoteReadScreen(note: note)));
          });
        },
      ),
    );
  }

  void addNote(dynamic data){
    setState(() {
      noteData.add(data);
    });
  }
}
