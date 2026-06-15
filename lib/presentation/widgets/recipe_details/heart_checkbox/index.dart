import 'package:flutter/material.dart';

import 'heart_painter.dart';

class HeartCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final double? hitSize;

  const HeartCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 24.0,
    this.hitSize,
  });

  double get _tapPadding {
    final targetHitSize = hitSize ?? size * 2;
    return (targetHitSize - size) / 2;
  }

  @override
  Widget build(BuildContext context) {
    final targetHitSize = hitSize ?? size * 2;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(targetHitSize / 2),
        onTap: () => onChanged(!value),
        child: Padding(
          padding: EdgeInsets.all(_tapPadding),
          child: CustomPaint(
            size: Size(size, size),
            painter: HeartPainter(isSelected: value),
          ),
        ),
      ),
    );
  }
}
