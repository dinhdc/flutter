import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, this.onPress});

  final IconData icon;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      textStyle: const TextStyle(color: Colors.white),
      disabledElevation: 6,
      onPressed: onPress,
      constraints: const BoxConstraints.tightFor(width: 40, height: 40),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
