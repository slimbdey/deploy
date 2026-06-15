import 'package:flutter/material.dart';
import 'package:hw/presentation/widgets/forms/validators.dart';

class ImageLinkForm extends StatefulWidget {
  final Function(String)? onChanged;

  const ImageLinkForm({super.key, required this.onChanged});

  @override
  State<ImageLinkForm> createState() => _ImageLinkFormState();
}

class _ImageLinkFormState extends State<ImageLinkForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: _controller,
        validator: Validators.emptyValidator,
        decoration: const InputDecoration(labelText: 'Вставьте ссылку'),
        onChanged: widget.onChanged,
      ),
    );
  }
}
