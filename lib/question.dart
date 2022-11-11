import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 50),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 30, color: Colors.blue),
      ),
    );
  }
}
