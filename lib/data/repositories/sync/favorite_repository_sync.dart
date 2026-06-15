import 'package:hw/data/dtos/favorite_dto.dart';

import '../favorite_repository.dart';

extension FavoriteRepositorySync on FavoriteRepository {
  Future<void> syncBackground() async {
    // implement syncing
  }

  Future<List<FavoriteDto>> getFavorites() async {
    if (isOffline) {
      final list = await ls.getFavorites();
      return list;
    }

    final saveList = await ds.getFavorites();

    await ls.initFavorites(saveList);
    return saveList;
  }
}
