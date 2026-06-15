import 'package:flutter/material.dart';

import 'app_route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'recipes') {
      final recipePath = uri.pathSegments[1];
      if (recipePath == 'create') return const AppRoutePath.recipeCreate();

      final recipeId = int.tryParse(recipePath);
      if (recipeId != null) return AppRoutePath.recipeDetails(recipeId);
    }

    return const AppRoutePath.home();
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    return RouteInformation(uri: Uri(path: configuration.location));
  }
}
