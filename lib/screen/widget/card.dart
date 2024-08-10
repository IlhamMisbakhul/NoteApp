import 'package:flutter/material.dart';
import 'package:noteapp/models/model.dart';
import 'package:noteapp/screen/view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index, required this.onNoteDeleded});

  final Note note;
  final int index;
  final Function(int) onNoteDeleded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NoteView(note: note, index: index, onNoteDeleded: onNoteDeleded,)));
      },
      child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      note.body,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]
                ),
              ),
            ),
    );
  }
}