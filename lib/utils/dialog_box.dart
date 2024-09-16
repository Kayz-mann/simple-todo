import 'package:flutter/material.dart';
import 'package:todos/utils/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: "Save",
                  onPressed: onSave,
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(width: 20),
                Button(
                  text: "Cancel",
                  onPressed: onCancel,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
