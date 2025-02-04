import 'package:flutter/material.dart';

class InnerNoteDescriptionScreen extends StatelessWidget {
  const InnerNoteDescriptionScreen({super.key});

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
        title: const TextField(
            decoration: InputDecoration(
              hintText: "Enter Title",
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.white54,
                fontSize: 24,
              ),
            )
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: () {
              print("Note Saved");
            },
          )
        ]
      ),

      body: Container(
        padding: const EdgeInsets.all(16),
        child: const TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: "Enter Note",
            border: InputBorder.none,
          ),
        ),
      )

    );
  }
}