import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw/presentation/widgets/forms/validators.dart';

class FormStepTime extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const FormStepTime({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        validator: Validators.emptyValidator,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          helperText: '',
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
        ],
      ),
    );
  }
}
