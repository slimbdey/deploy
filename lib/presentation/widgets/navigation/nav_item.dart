import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String title;
  final String asset;
  final bool selected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.title,
    required this.asset,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            height: 24,
            width: 24,
            gaplessPlayback: true,
            color: selected
                ? colorScheme.onPrimaryFixedVariant
                : colorScheme.onPrimaryContainer,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: textTheme.labelSmall?.copyWith(
              color: selected
                  ? colorScheme.onPrimaryFixedVariant
                  : colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
