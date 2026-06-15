import 'package:flutter/material.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/layout.dart';

class Modal {
  static void open(
    BuildContext context,
    String title,
    Widget content,
    void Function()? submit,
  ) {
    FocusManager.instance.primaryFocus?.unfocus();

    showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        final l10 = AppLocalizations.of(context)!;

        return Layout(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxHeight < constraints.maxWidth;

              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding: const EdgeInsetsGeometry.only(
                  top: 30,
                  bottom: 30,
                ),
                title: Text(title),
                content: SizedBox(
                  width: isLandscape
                      ? constraints.maxWidth * 0.5
                      : constraints.maxWidth,
                  child: SingleChildScrollView(child: content),
                ),
                actions: [
                  FilledButton(
                    onPressed: submit,
                    child: Text(l10.save),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
