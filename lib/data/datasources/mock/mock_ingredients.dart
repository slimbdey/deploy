import 'dart:math';

import 'package:hw/data/datasources/mock/mock_measure_units.dart';
import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/ref_dto.dart';

final measureUnits = mockMeasureUnits();
final random = Random();

final ingredientNames = [
  'Соевый соус',
  'Мед',
  'Чеснок',
  'Тертый имбирь',
  'Лимонный сок',
  'Кукурузный крахмал',
  'Филе лосося',
  'Соус томатный',
  'Сыр Моцарелла',
  'Помидор',
  'Базилик зеленый',
];

List<IngredientDto> mockIngredients() =>
    List.generate(ingredientNames.length, (index) {
      final name = ingredientNames[index];
      final measureIndex = random.nextInt(measureUnits.length);

      return IngredientDto(
        id: index,
        name: name,
        caloriesForUnit: 0,
        measureUnit: RefDto(id: measureUnits[measureIndex].id ?? 0),
      );
    });
