import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({required this.colors, super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors, begin: startAlignment, end: endAlignment)),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-1.png',
              width: 200.0,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Roll Dice'),
              style: TextButton.styleFrom(
                  // padding: EdgeInsets.only(top: 20),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28)),
            )
          ],
        )));
  }
}
