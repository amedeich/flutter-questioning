import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;
  Result(this.score, this.resetHandler);

  String get resultText {
    return "You did it, with an score of ${this.score}!";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: this.resetHandler,
              child: Text('Reset Quiz!'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
