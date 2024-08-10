import 'package:flutter/material.dart';
import 'package:noteapp/models/model.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note, required this.index, required this.onNoteDeleded});

  final Note note;
  final int index;

  final Function(int) onNoteDeleded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text View'),
        actions: [
          IconButton(onPressed: (){
            showDialog(
              context: context, builder: (context){
                return AlertDialog(
                  title: Text(' Delete This Note?'),
                  content: Text('Note ${note.title} will be deleted!'),

                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        onNoteDeleded(index);
                        Navigator.of(context).pop();
                      }, 
                      child: Text('YES')
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: Text('NO')
                      ),
                  ],
                );
              }
              );
          }, 
          icon: Icon(Icons.delete))
        ],
      ),

      body : Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 26
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              note.body,
              style: const TextStyle(
                fontSize: 16
              ),
            )
          ],
        ),
      )
    );
  }
}