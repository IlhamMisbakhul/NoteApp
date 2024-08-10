import 'package:flutter/material.dart';
import 'package:noteapp/models/model.dart';
import 'package:noteapp/screen/new_note.dart';
import 'package:noteapp/screen/widget/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Notes'),
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index){
          return NoteCard(note: notes[index], index: index, onNoteDeleded: onNoteDeleded);
        }
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: (
        ){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewNote(onNewNoteCreated: onNewNoteCreated,)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note){
    notes.add(note);
    setState(() {
      
    });
  }
  void onNoteDeleded(int index){
    notes.removeAt(index);
    setState(() {
      
    });
  }
}