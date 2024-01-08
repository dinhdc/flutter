import 'package:flutter/material.dart';

class TextButtonIcon extends StatelessWidget {
  const TextButtonIcon(
      {super.key,
      required this.onClick,
      required this.label,
      required this.icon});

  final void Function() onClick;
  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        onClick();
      },
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 237, 223, 252),
      ),
      label: Text(label),
      icon: icon,
    );
  }
}
