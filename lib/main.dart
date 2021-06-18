import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 50},
        {'text': 'Elephant', 'score': 40},
        {'text': 'Snake', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favourite city?',
      'answers': [
        {'text': 'Maracaibo', 'score': 80},
        {'text': 'Miami', 'score': 10},
        {'text': 'Bogotá', 'score': 10}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetHandler() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() => _questionIndex = _questionIndex + 1);
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Awesome Q/A App!!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetHandler),
      ),
    );
  }
}
