import 'package:flutter/material.dart';

class HeartPainter extends CustomPainter {
  final bool isSelected;

  HeartPainter({required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isSelected ? Colors.red : Colors.grey[800]!
      ..style = PaintingStyle.fill;

    final path = Path();
    double width = size.width * 0.8;
    double height = size.height;
    double offset = (size.width - width) / 2;

    path.moveTo(offset + width / 2, height);
    path.lineTo(offset + 0, height * 0.6);
    path.arcToPoint(
      Offset(offset + width * 0.5, height * 0.25),
      radius: Radius.circular(width * 0.25),
    );
    path.arcToPoint(
      Offset(offset + width, height * 0.6),
      radius: Radius.circular(width * 0.25),
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant HeartPainter oldDelegate) {
    return oldDelegate.isSelected != isSelected;
  }
}
