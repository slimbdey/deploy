import 'package:flutter/material.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/layout.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  const Wrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;
    final l10 = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10.recipe, style: textScheme.headlineLarge)),
      body: Layout(child: child),
    );
  }
}
