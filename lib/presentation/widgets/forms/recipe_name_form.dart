import 'package:flutter/material.dart';
import 'package:hw/presentation/widgets/forms/validators.dart';

class RecipeNameForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String?) onChanged;

  const RecipeNameForm({
    super.key,
    required this.formKey,
    required this.onChanged,
  });

  @override
  State<RecipeNameForm> createState() => _RecipeAddFormState();
}

class _RecipeAddFormState extends State<RecipeNameForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        autofillHints: const [AutofillHints.name],
        keyboardType: TextInputType.name,
        controller: _controller,
        validator: Validators.emptyValidator,
        decoration: const InputDecoration(labelText: 'Название рецепта'),
        onChanged: widget.onChanged,
      ),
    );
  }
}
