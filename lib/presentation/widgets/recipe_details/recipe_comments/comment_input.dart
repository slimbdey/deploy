import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  final VoidCallback onIconPressed;
  final VoidCallback onSubmit;
  final TextEditingController controller;

  const CommentInput({
    super.key,
    required this.onIconPressed,
    required this.onSubmit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: colorScheme.onPrimaryFixed, width: 2),
    );

    return Stack(
      children: [
        TextField(
          controller: controller,
          minLines: 3,
          maxLines: 3,
          style: TextStyle(fontSize: 16, height: 1.5),
          decoration: InputDecoration(
            hintText: 'оставить комментарий',
            hintStyle: TextStyle(color: colorScheme.onPrimaryContainer),
            contentPadding: const EdgeInsets.only(
              left: 16,
              top: 12,
              bottom: 12,
              right: 48,
            ),
            border: border,
            focusedBorder: border,
            enabledBorder: border,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: IconButton(
            icon: Icon(
              Icons.image_outlined,
              color: colorScheme.onPrimaryFixed,
              size: 24,
            ),
            onPressed: onIconPressed,
          ),
        ),
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            if (value.text.isEmpty) return const SizedBox.shrink();

            return Positioned(
              bottom: 4,
              right: 4,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: colorScheme.onPrimaryFixed,
                ),
                onPressed: onSubmit,
              ),
            );
          },
        ),
      ],
    );
  }
}
