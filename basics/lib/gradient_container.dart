import 'package:flutter/material.dart';
import 'dart:math';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  const GradientContainer({required this.colors, super.key});

  final List<Color> colors;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  int diceNumber = 1;

  int rollDice(){
    return Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: widget.colors, begin: startAlignment, end: endAlignment)),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$diceNumber.png',
              width: 200.0,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  diceNumber = rollDice();
                });
              },
              style: TextButton.styleFrom(
                  // padding: EdgeInsets.only(top: 20),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28)),
              child: const Text('Roll Dice'),
            )
          ],
        )));
  }
}
