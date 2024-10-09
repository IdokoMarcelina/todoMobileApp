import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function (BuildContext)? deleteFunction;
   TodoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteFunction});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children:[ SlidableAction(
                onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,

            ),
        ]
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),),
          child: Row(
            children: [
              Checkbox(value: widget.taskCompleted,
                  onChanged: widget.onChanged,
              activeColor: Colors.black,),
        
              Text(widget.taskName, style: TextStyle(decoration: widget.taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),),
        
        
            ],
          ),
        ),
      ),
    );
  }
}
