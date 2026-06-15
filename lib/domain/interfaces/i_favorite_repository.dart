import 'package:hw/domain/entities/favorite.dart';

abstract class IFavoriteRepository {
  Future<List<Favorite>> getList();
  Future<Favorite> create(Favorite favorite);
  Future<void> delete(int id);
}
