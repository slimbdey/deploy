import 'package:flutter/material.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final l10 = AppLocalizations.of(context)!;

    return Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/add_recipe_photo.png', height: 48, width: 48),
        Text(l10.addRecipePhoto, style: texts.bodyMedium),
      ],
    );
  }
}
