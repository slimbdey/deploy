// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/data/datasources/hive_datasource.dart';
import 'package:hw/data/datasources/mock/index.dart';
import 'package:hw/data/datasources/network_datasource.dart';
import 'package:hw/data/repositories/comment_repository.dart';
import 'package:hw/data/repositories/favorite_repository.dart';
import 'package:hw/data/repositories/ingredient_repository.dart';
import 'package:hw/data/repositories/measure_unit_repository.dart';
import 'package:hw/data/repositories/recipe_repository/index.dart';
import 'package:hw/data/services/firebase_login_service.dart';
import 'package:hw/domain/interfaces/i_comment_repository.dart';
import 'package:hw/domain/interfaces/i_favorite_repository.dart';
import 'package:hw/domain/interfaces/i_ingredient_repository.dart';
import 'package:hw/domain/interfaces/i_login_service.dart';
import 'package:hw/domain/interfaces/i_measure_unit_repository.dart';
import 'package:hw/domain/interfaces/i_recipe_repository.dart';

List<RepositoryProvider> getProviders() {
  final mockSource = MockDatasource();
  final networkSource = NetworkDataSource();
  final localSource = HiveDatasource();
  final dataSource = mockSource;

  final recipeRepository = RecipeRepository(
    datasource: dataSource,
    localsource: localSource,
  );
  final measureUnitRepository = MeasureUnitRepository(
    ds: dataSource,
    ls: localSource,
  );
  final ingredientRepository = IngredientRepository(ds: dataSource);
  final commentRepository = CommentRepository(ds: dataSource, ls: localSource);
  final favoriteRepository = FavoriteRepository(
    ds: dataSource,
    ls: localSource,
  );

  return [
    RepositoryProvider<IFavoriteRepository>(create: (_) => favoriteRepository),
    RepositoryProvider<ICommentRepository>(create: (_) => commentRepository),
    RepositoryProvider<IRecipeRepository>(create: (_) => recipeRepository),
    RepositoryProvider<IMeasureUnitRepository>(
      create: (_) => measureUnitRepository,
    ),
    RepositoryProvider<IIngredientRepository>(
      create: (_) => ingredientRepository,
    ),
    RepositoryProvider<ILoginService>(create: (_) => FirebaseLoginService()),
  ];
}
