import 'package:aptnote/services/firestore.dart';
import 'package:flutter/material.dart';

class InnerNoteDescriptionScreen extends StatefulWidget {
  const InnerNoteDescriptionScreen({super.key});

  @override
  State<InnerNoteDescriptionScreen> createState() =>
      _InnerNoteDescriptionScreenState();
}

class _InnerNoteDescriptionScreenState
    extends State<InnerNoteDescriptionScreen> {
  // Firestore service
  final FirestoreService firestoreService = FirestoreService();

  // Controllers for title and note
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  void handleAddNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Do you want to save this note?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              firestoreService.addNote(
                titleController.text.trim(),
                noteController.text.trim(),
              );
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close InnerNoteDescriptionScreen
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: "Enter Title",
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: handleAddNote, // Calls handleAddNote function
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: noteController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: "Enter Note",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
