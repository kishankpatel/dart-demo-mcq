import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  const Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => selectHandler(answerText),
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 25, 120, 82),
          textStyle: const TextStyle(
            fontSize: 20,
          ),
          padding: const EdgeInsets.all(10),
          minimumSize: const Size(200, 40)),
      child: Text(answerText),
    );
  }
}
