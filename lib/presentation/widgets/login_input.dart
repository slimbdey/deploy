import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;
  final bool autoFocus;
  final String? errorText;
  final bool isLoading;

  const LoginInput(
      {super.key,
      required this.controller,
      required this.label,
      required this.onChanged,
      this.autoFocus = false,
      this.errorText,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 232,
      child: TextFormField(
        autofocus: autoFocus,
        style: const TextStyle(color: Colors.black87),
        cursorColor: const Color(0xFFB0B0B0),
        controller: controller,
        enabled: !isLoading,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.white),
          hintText: label,
          hintStyle: const TextStyle(
            color: Color(0xFFCCCCCC),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Color(0xFFB0B0B0),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 48,
          ),
          filled: true,
          fillColor: isLoading ? Colors.grey[300] : Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
