import 'package:hw/data/dtos/recipe_dto.dart';

final List<RecipeDto> rawRecipes = [
  RecipeDto(
    id: 0,
    name: 'Лосось в соусе терияки',
    duration: 45,
    photo: 'assets/images/0.jpg',
  ),
  RecipeDto(
    id: 1,
    name: 'Поке боул с сыром тофу',
    duration: 30,
    photo: 'assets/images/1.jpg',
  ),
  RecipeDto(
    id: 2,
    name: 'Стейк из говядины по-грузински с кукурузой',
    duration: 75,
    photo: 'assets/images/2.jpg',
  ),
  RecipeDto(
    id: 3,
    name: 'Тосты с голубикой и бананом',
    duration: 45,
    photo: 'assets/images/3.jpg',
  ),
  RecipeDto(
    id: 4,
    name: 'Паста с морепродуктами',
    duration: 25,
    photo: 'assets/images/4.jpg',
  ),
  RecipeDto(
    id: 5,
    name: 'Бургер с двумя котлетами',
    duration: 60,
    photo: 'assets/images/5.jpg',
  ),
  RecipeDto(
    id: 6,
    name: 'Пицца Маргарита домашняя',
    duration: 25,
    photo: 'assets/images/6.jpg',
  ),
];

List<RecipeDto> mockRecipes() => rawRecipes;
