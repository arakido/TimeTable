import 'package:flutter/material.dart';

class CourseDialog extends StatelessWidget{
  final List data;
  VoidCallback onSave;
  VoidCallback onCancel;

  CourseDialog({
    super.key,
    required this.data,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController hallController = TextEditingController();

    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Course',
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'time',
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: hallController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'hall',
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: ()=>{
                  data.clear(),
                  onCancel()
                },
                  color: Colors.yellow[300],
                  child: const Text("Delete"),
                ),
                const SizedBox(width: 10,),

                MaterialButton(onPressed: ()=>{onCancel},
                  color: Colors.yellow[300],
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 10,),

                MaterialButton(onPressed: ()=>{
                  data.clear(),
                  data.add(titleController.text),
                  data.add(timeController.text),
                  data.add(hallController.text),
                  onSave()
                },
                  color: Colors.yellow[300],
                  child: const Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}