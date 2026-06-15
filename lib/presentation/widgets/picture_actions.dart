import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/forms/image_link_form.dart';
import 'package:hw/presentation/widgets/modal.dart';
import 'package:image_picker/image_picker.dart';

import 'recipe_create/recipe_picture/action_button.dart';

class PictureActions {
  final Function(File?) onImageSelected;
  final VoidCallback onImageDelete;
  String link = "";

  PictureActions({required this.onImageSelected, required this.onImageDelete});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      onImageSelected(File(pickedFile.path));
    }
    if (context.mounted) Navigator.pop(context);
  }

  void _submitLink(BuildContext context) {
    onImageSelected(File(link));

    if (context.mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void deleteHandler(BuildContext context) {
    onImageDelete();
    if (context.mounted) Navigator.pop(context);
  }

  void showPicker(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    final l10 = AppLocalizations.of(context)!;
    FocusManager.instance.primaryFocus?.unfocus();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext bc) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  ActionButton(
                    onTap: () => _pickImage(context, ImageSource.camera),
                    text: l10.makePhoto,
                  ),
                  const Divider(),
                  ActionButton(
                    onTap: () => _pickImage(context, ImageSource.gallery),
                    text: l10.pickFromAlbum,
                  ),
                  const Divider(),
                  ActionButton(
                    onTap: () => Modal.open(
                      context,
                      l10.url,
                      ImageLinkForm(onChanged: (value) => link = value),
                      () => _submitLink(context),
                    ),
                    text: l10.pickFromUrl,
                  ),
                  const Divider(),
                  ActionButton(
                    onTap: () => deleteHandler(context),
                    text: l10.delete,
                    color: Colors.red,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                child: TextButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.secondary,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10.cancel, style: texts.bodyLarge),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
