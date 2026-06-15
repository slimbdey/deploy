import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const ActionButton({
    super.key,
    this.color = Colors.black,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        foregroundColor: color,
        textStyle: texts.bodyLarge,
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onTap,
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
