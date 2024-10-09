import 'package:flutter/material.dart';
import 'package:todo/utilities/my_buttons.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[200],
      content: Container(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 80,
              child: TextField(
                controller: widget.controller,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Add a new task",),
              ),
            ),

            SizedBox(height: 15,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text: "Save", onPressed: widget.onSave),
                SizedBox(width: 20,),
                MyButtons(text: "Cancel", onPressed: widget.onCancel)
              ],
            )

          ],
        ),
      ),
    );
  }
}
