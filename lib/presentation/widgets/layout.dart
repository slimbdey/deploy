import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;
  const Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          final isLandscape = orientation == Orientation.landscape;

          return Align(
            alignment: AlignmentGeometry.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    isLandscape ? constraints.maxWidth / 2 : double.infinity,
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
