import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Stack(
      children: [
        Positioned(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/sunny.png', width: 300),
          ),
        ),
        WaveWidget(
          config: CustomConfig(
            colors: [
              const Color(0xff5BADD7),
              const Color(0xff324CCD),
              const Color(0xff3299CD),
              Colors.black38
            ],
            durations: [
              3000,
              4000,
              5000,
              6500,
            ],
            heightPercentages: [
              0.60,
              0.62,
              0.64,
              0.66,
            ],
          ),
          size: const Size(double.infinity, double.infinity),
        ),
        Positioned.fill(
          bottom: 70,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton.icon(
                  onPressed:
                      startQuiz, //execute quiz function when button is pressed
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text('Start Quiz'))),
        ),
      ],
    );
  }
}
