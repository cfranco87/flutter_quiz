import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/screen/question_screen.dart';
import 'package:adv_basics/screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/screen/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; //final list of answers
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen =
          'question-screen'; //switch screen from start -> question screen
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers
        .add(answer); //adding answers to selected answer through this method

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffBF3475),
        Color(0xffEE6C45),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: screenWidget,
    )));
  }
}
