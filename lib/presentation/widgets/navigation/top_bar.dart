import 'package:flutter/material.dart';
import 'package:hw/presentation/widgets/language_switch.dart';
import 'package:hw/presentation/widgets/sign_out.dart';

class TopBar extends StatelessWidget {
  final bool hideSignOut;
  const TopBar({super.key, this.hideSignOut = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LanguageSwitch(),
        if (!hideSignOut) SignOut(),
      ],
    );
  }
}
