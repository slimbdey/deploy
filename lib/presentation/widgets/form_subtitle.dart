import 'package:flutter/material.dart';

class FormSubtitle extends StatelessWidget {
  final String label;
  const FormSubtitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(label, style: textScheme.titleMedium)],
    );
  }
}
