import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/bloc/locale/constants.dart';
import 'package:hw/presentation/bloc/locale/locale_bloc.dart';
import 'package:hw/presentation/bloc/locale/locale_event.dart';
import 'package:hw/presentation/bloc/locale/locale_state.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        final currentLang = state.locale.languageCode;

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.read<LocaleBloc>().add(ChangeLocaleEvent(Locales.ru));
                },
                child: Text(
                  'русский',
                  style: TextStyle(
                    fontWeight: currentLang == Locales.ru
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color:
                        currentLang == Locales.ru ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              const Text('|', style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () {
                  context.read<LocaleBloc>().add(ChangeLocaleEvent(Locales.en));
                },
                child: Text(
                  'english',
                  style: TextStyle(
                    fontWeight: currentLang == Locales.en
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color:
                        currentLang == Locales.en ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
