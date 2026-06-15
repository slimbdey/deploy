import 'package:flutter/material.dart';

import 'validators.dart';

class RecipeIngredientForm extends StatefulWidget {
  final List<String>? initialValues;
  final GlobalKey<FormState> formKey;

  const RecipeIngredientForm({
    super.key,
    required this.formKey,
    this.initialValues,
  });

  @override
  State<RecipeIngredientForm> createState() => RecipeIngredientFormState();
}

class RecipeIngredientFormState extends State<RecipeIngredientForm> {
  late TextEditingController _controllerName;
  late TextEditingController _controllerQuantity;

  List<String> getValues() {
    return [_controllerName.text, _controllerQuantity.text];
  }

  bool validate() {
    return widget.formKey.currentState?.validate() ?? false;
  }

  @override
  void initState() {
    super.initState();

    _controllerName = TextEditingController(
      text: (widget.initialValues != null && widget.initialValues!.isNotEmpty)
          ? widget.initialValues![0]
          : '',
    );
    _controllerQuantity = TextEditingController(
      text: (widget.initialValues != null && widget.initialValues!.isNotEmpty)
          ? widget.initialValues![1]
          : '',
    );
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerQuantity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Form(
          key: widget.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                autofillHints: const [AutofillHints.name],
                keyboardType: TextInputType.name,
                controller: _controllerName,
                validator: Validators.emptyValidator,
                decoration: const InputDecoration(
                  labelText: 'Название ингредиента',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _controllerQuantity,
                validator: Validators.emptyValidator,
                decoration: const InputDecoration(labelText: 'Количество'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
