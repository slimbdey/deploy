import 'dart:io' show File;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hw/presentation/widgets/picture_actions.dart';
import 'package:hw/presentation/widgets/recipe_create/recipe_picture/image_placeholder.dart';
import 'package:hw/presentation/widgets/utils.dart';

class RecipePicture extends StatefulWidget {
  final Function(String?) onImageSelected;

  const RecipePicture({super.key, required this.onImageSelected});

  @override
  State<RecipePicture> createState() => _RecipePictureState();
}

class _RecipePictureState extends State<RecipePicture> {
  String _imagePath = '';

  void _imageSelectedInterceptor(File? image, BuildContext context) {
    final path = image?.path ?? '';
    setState(() {
      _imagePath = path;
    });

    widget.onImageSelected(path.isEmpty ? null : path);
  }

  void _onImageDelete() => setState(() {
        _imagePath = '';
      });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final actions = PictureActions(
      onImageSelected: (img) => _imageSelectedInterceptor(img, context),
      onImageDelete: _onImageDelete,
    );

    return InkWell(
      onTap: () => actions.showPicker(context),
      borderRadius: BorderRadius.circular(12),
      child: DecoratedBox(
        decoration: BoxDecoration(color: colors.secondary),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            dashPattern: [16, 16],
            strokeWidth: 1,
            radius: const Radius.circular(3),
            color: colors.onPrimaryFixed,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 215,
            child: _imagePath.isEmpty
                ? const ImagePlaceholder()
                : Stack(
                    children: [
                      Utils.getRecipeImage(_imagePath, double.infinity, 220),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
