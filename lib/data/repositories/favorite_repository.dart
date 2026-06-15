import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/datasources/i_localstorage.dart';
import 'package:hw/data/dtos/favorite_dto.dart';
import 'package:hw/data/mappers/favorite_mapper.dart';
import 'package:hw/data/repositories/network_checker.dart';
import 'package:hw/data/repositories/sync/favorite_repository_sync.dart';
import 'package:hw/domain/entities/favorite.dart';
import 'package:hw/domain/interfaces/i_favorite_repository.dart';

class FavoriteRepository extends NetworkChecker implements IFavoriteRepository {
  final IDatasource ds;
  final ILocalStorage ls;

  FavoriteRepository({required this.ds, required this.ls});

  List<Favorite> _mapList(List<FavoriteDto> dtos) =>
      dtos.map(FavoriteMapper.mapDtoToEntity).toList();

  @override
  Future<List<Favorite>> getList() async {
    await syncBackground();
    final dtos = await getFavorites();
    return _mapList(dtos);
  }

  @override
  Future<Favorite> create(Favorite value) async {
    final dto = FavoriteMapper.mapEntityToDto(value);
    final result = await ds.addFavorite(dto);
    return FavoriteMapper.mapDtoToEntity(result);
  }

  @override
  Future<void> delete(int id) async {
    final dtos = await ds.getFavorites();
    final favoriteIds =
        dtos.where((f) => f.recipe.id == id).map((it) => it.id as int).toList();
    await Future.wait(
        favoriteIds.map((favoriteId) => ds.deleteFavorite(favoriteId)));
  }
}
