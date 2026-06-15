import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final bool isOutlined;
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const FormSubmitButton({
    super.key,
    required this.isOutlined,
    required this.label,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return OutlinedButton(
      style: FilledButton.styleFrom(
        backgroundColor:
            isOutlined ? colorScheme.primary : colorScheme.onPrimaryFixed,
        foregroundColor:
            isOutlined ? colorScheme.onPrimaryFixed : colorScheme.secondary,
      ),
      onPressed: isLoading ? null : onPressed,
      child: Text(label),
    );
  }
}
