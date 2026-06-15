import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_step.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/form_step_time.dart';

import 'validators.dart';

class RecipeStepForm extends StatefulWidget {
  final RecipeStep? editStep;
  final GlobalKey<FormState> formKey;

  const RecipeStepForm({super.key, required this.formKey, this.editStep});

  @override
  State<RecipeStepForm> createState() => RecipeStepFormState();
}

class RecipeStepFormState extends State<RecipeStepForm> {
  late TextEditingController _controllerContent;
  late TextEditingController _controllerMinutes;
  late TextEditingController _controllerSeconds;

  RecipeStep getStep() {
    final minutes = (int.tryParse(_controllerMinutes.text) ?? 0) * 60;
    final seconds = (int.tryParse(_controllerSeconds.text) ?? 0);

    return RecipeStep(
      id: widget.editStep?.id ?? -1,
      content: _controllerContent.text,
      duration: minutes + seconds,
    );
  }

  bool validate() {
    return widget.formKey.currentState?.validate() ?? false;
  }

  @override
  void initState() {
    super.initState();

    if (widget.editStep != null) {
      _controllerContent = TextEditingController(
        text: widget.editStep!.content,
      );
      final minutes = widget.editStep!.duration ~/ 60;
      final seconds = widget.editStep!.duration % 60;
      _controllerMinutes = TextEditingController(text: minutes.toString());
      _controllerSeconds = TextEditingController(text: seconds.toString());

      return;
    }

    _controllerContent = TextEditingController(text: '');
    _controllerMinutes = TextEditingController(text: '');
    _controllerSeconds = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _controllerContent.dispose();
    _controllerMinutes.dispose();
    _controllerSeconds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: _controllerContent,
              validator: Validators.emptyValidator,
              decoration: InputDecoration(
                labelText: l10.stepDescription,
                labelStyle: TextStyle(height: 2),
              ),
              minLines: 9,
              maxLines: 9,
              style: TextStyle(height: 1.2),
            ),
          ),
          Text(
            l10.stepDuration,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
              height: 12 / 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormStepTime(label: l10.minutes, controller: _controllerMinutes),
              FormStepTime(label: l10.seconds, controller: _controllerSeconds),
            ],
          ),
        ],
      ),
    );
  }
}
