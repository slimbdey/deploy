import 'package:hw/domain/entities/favorite.dart';

abstract class FavoriteEvent {
  const FavoriteEvent();
}

class FavoritesLoadEvent extends FavoriteEvent {
  const FavoritesLoadEvent();
}

class FavoritesAddEvent extends FavoriteEvent {
  final Favorite favorite;

  const FavoritesAddEvent(this.favorite);
}

class FavoritesDeleteEvent extends FavoriteEvent {
  final int id;

  const FavoritesDeleteEvent(this.id);
}
