import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hw/core/dependency_injection.dart';
import 'package:hw/domain/interfaces/i_comment_repository.dart';
import 'package:hw/domain/interfaces/i_favorite_repository.dart';
import 'package:hw/domain/interfaces/i_ingredient_repository.dart';
import 'package:hw/domain/interfaces/i_login_service.dart';
import 'package:hw/domain/interfaces/i_recipe_repository.dart';
import 'package:hw/firebase_options.dart';
import 'package:hw/presentation/bloc/auth/auth_bloc.dart';
import 'package:hw/presentation/bloc/comment/comment_bloc.dart';
import 'package:hw/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:hw/presentation/bloc/ingredient/ingredient_bloc.dart';
import 'package:hw/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:hw/presentation/bloc/recipe/recipe_events.dart';
import 'package:hw/presentation/widgets/utils.dart';

import 'presentation/bloc/locale/constants.dart';
import 'presentation/bloc/locale/locale_bloc.dart';
import 'presentation/bloc/locale/locale_state.dart';
import 'presentation/l10n/app_localizations.dart';
import 'presentation/router/index.dart';
import 'presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: getProviders(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocaleBloc(),
          ),
          BlocProvider(
            create: (context) => RecipeBloc(context.read<IRecipeRepository>())
              ..add(RecipesLoadEvent()),
          ),
          BlocProvider(
            create: (context) => FavoriteBloc(
              context.read<IFavoriteRepository>(),
              context.read<IRecipeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) =>
                CommentBloc(context.read<ICommentRepository>()),
          ),
          BlocProvider(
              create: (context) =>
                  IngredientBloc(context.read<IIngredientRepository>())),
          BlocProvider(
            create: (context) => AuthBloc(context.read<ILoginService>()),
          ),
        ],
        child: BlocBuilder<LocaleBloc, LocaleState>(
            builder: (context, localeState) {
          return MaterialApp.router(
            locale: localeState.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale(Locales.ru),
              Locale(Locales.en),
            ],
            scrollBehavior: MyCustomScrollBehavior(),
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            routerDelegate: routerDelegate,
            routeInformationParser: routeInformationParser,
          );
        }),
      ),
    );
  }
}
