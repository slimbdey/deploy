import 'package:flutter/material.dart';

class FormControlButton extends StatelessWidget {
  final VoidCallback onClick;
  final IconData icon;

  const FormControlButton({
    super.key,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: onClick,
      icon: Icon(icon, size: 24, color: colors.onPrimaryFixed),
    );
  }
}
