import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable/Note/noteColor.dart';

class WeekCard extends StatelessWidget {
  final List data;
  final int index;
  Function(List) onTap;
  late String iconName;
  late Color color;

  WeekCard({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
  }){
    iconName = 'assets/week${index + 1}.png';
    color = NoteColor.cardColor[index];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 212, 212, 212),
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: Offset(5, 5)
              )
        ]),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(iconName, height: 40, width: 40,)
            ),
            Column(
              children: data.map((note) => courseCard(context, note)).toList(),
            )
          ]
        ),
      ),
    );
  }

  Widget courseCard(BuildContext context, List note) {
    if (note.isEmpty) {
      return Padding(
          padding: const EdgeInsets.all(10),
          child:Container(
            decoration: BoxDecoration(
            color: color.withAlpha(50),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(42, 155, 155, 155),
                  spreadRadius: 4,
              )
            ]),
            width: 160,
            height: 160,
            child: IconButton(
                onPressed: ()=>{onTap(note)},
                icon: const Icon(Icons.add)),
          ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 160,
        height: 160,
        child: InkWell(
          onTap: ()=>{onTap(note)},
          child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 15, 0, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(note[0], style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),),
                  const SizedBox(height: 5,),
                  Text(note[1], style: GoogleFonts.poppins(fontSize: 12),),
                  const SizedBox(height: 5),
                  Text(note[2], style: const TextStyle(fontWeight: FontWeight.w500,),),
                ],
              )
          ),
        ),
      )
    );
  }
}
