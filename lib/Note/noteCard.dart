import 'package:flutter/material.dart';
import 'package:timetable/Note/noteColor.dart';

Widget noteCard(dynamic data, Function() onTap){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: NoteColor.cardColor[data['colorId']],
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data['title'], style: NoteColor.mainTitle,),
          const SizedBox(height: 4,),
          Text(data['date'], style: NoteColor.dateTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8,),
          Expanded(child: Text(data['content'], style: NoteColor.mainContent, softWrap : true, overflow: TextOverflow.ellipsis , maxLines: 2,))

        ],
      ),
    ),
  );
}