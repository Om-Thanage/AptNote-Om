import 'package:flutter/material.dart';
import 'package:habit_tracker/services/firestore.dart';

class UpdateNoteDescription extends StatefulWidget {
  final String docId;
  final String title;
  final String content;

  const UpdateNoteDescription({
    super.key,
    required this.docId,
    required this.title,
    required this.content,
  });

  @override
  State<UpdateNoteDescription> createState() => _UpdateNoteDescriptionState();
}

class _UpdateNoteDescriptionState extends State<UpdateNoteDescription> {
  final FirestoreService firestoreService = FirestoreService();
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _contentController = TextEditingController(text: widget.content);
  }

  void updateNote() async {
    try {
      await firestoreService.updateNote(
        widget.docId,
        _titleController.text,
        _contentController.text,
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating note: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: const Text("Update Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              maxLines: null,
              decoration: const InputDecoration(labelText: "Content"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateNote,
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
