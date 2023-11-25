import 'package:flutter/material.dart';

class TodoDialog extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  TodoDialog({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'New Task',
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: onSave,
                  child: Text('Save'),
                  color: Colors.yellow[300],
                ),
                const SizedBox(width: 10,),
                MaterialButton(onPressed: onCancel,
                  child: Text("Cancel"),
                  color: Colors.yellow[300],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}