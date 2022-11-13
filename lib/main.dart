import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  bool _finishedAllQuestion = false;
  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'options': ['Red', 'Green', 'Blue', 'Pink'],
      'answer': ''
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'options': ['Rabbit', 'Gorilla', 'Bear', 'Penguine'],
      'answer': ''
    },
    {
      'questionText': 'What\'s your favorite food?',
      'options': ['Rice', 'Grilled Chicken', 'Barries', 'Papper Chicken'],
      'answer': ''
    },
  ];

  var stepInfo = ['Step 1', 'Step 2', 'Step 3', 'Step 4'];
  void _answerQuestion(answerText) {
    setState(() {
      questions[_questionIndex]['answer'] = answerText;
      if (_questionIndex < questions.length - 1) {
        _questionIndex = _questionIndex + 1;
      } else {
        _questionIndex = 0;
        _finishedAllQuestion = true;
      }
    });
  }

  void _reTry() {
    setState(() {
      _finishedAllQuestion = false;
      _questionIndex = 0;
      questions.forEach((question) {
        question['answer'] = '';
      });
    });
  }

  String get _step {
    return stepInfo[_questionIndex];
  }

  // const MyAppState({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        // body: const Text('Hello Kishan!')),
        body: Column(
            children: _finishedAllQuestion
                ? [
                    Result(questions, _reTry),
                  ]
                : [
                    Text(_step),
                    Question(
                        questions[_questionIndex]['questionText'] as String),
                    ...(questions[_questionIndex]['options'] as List<String>)
                        .map((answer) {
                      return Answer(_answerQuestion, answer);
                    }).toList(),
                  ]),
      ),
    );
  }
}
