import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // const Result({super.key});

  final Object questions;
  final Function reTry;
  const Result(this.questions, this.reTry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(20),
        child: const Text(
          'Congratulations!!! \n You have answered all questions.',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 81, 163, 95),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      ...(questions as List<Map<String, Object>>).map(
        (question) {
          return Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'Your answer for question "${question['questionText'].toString()}" is "${question['answer'].toString()}"',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 68, 58, 168),
              ),
            ),
          );
        },
      ).toList(),
      Center(
        child: ElevatedButton(
          onPressed: () => reTry(),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 25, 120, 82),
              textStyle: const TextStyle(
                fontSize: 20,
              ),
              padding: const EdgeInsets.all(10),
              minimumSize: const Size(200, 40)),
          child: const Text('Restart'),
        ),
      ),
    ]);
  }
}
