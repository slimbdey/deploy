import 'package:hw/domain/entities/ingredient.dart';

abstract class IIngredientRepository {
  Future<List<Ingredient>> getFridgeList();
}
