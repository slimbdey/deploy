import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/mappers/ingredient_mapper.dart';
import 'package:hw/domain/entities/ingredient.dart';
import 'package:hw/domain/interfaces/i_ingredient_repository.dart';

class IngredientRepository implements IIngredientRepository {
  final IDatasource ds;

  IngredientRepository({required this.ds});

  @override
  Future<List<Ingredient>> getFridgeList() async {
    final measureUnitDtos = await ds.getMeasureUnits();
    final dtos = await ds.getIngredients();

    return dtos
        .map((dto) => IngredientMapper.mapDtoToEntity(dto, measureUnitDtos))
        .toList();
  }
}
