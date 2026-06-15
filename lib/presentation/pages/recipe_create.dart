import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:hw/presentation/bloc/recipe/recipe_events.dart';
import 'package:hw/presentation/widgets/forms/recipe_name_form.dart';
import 'package:hw/presentation/widgets/layout.dart';
import 'package:hw/presentation/widgets/recipe_create/recipe_ingredients/index.dart';
import 'package:hw/presentation/widgets/recipe_create/recipe_picture/index.dart';
import 'package:hw/presentation/widgets/recipe_create/recipe_steps/index.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({super.key});

  @override
  State<StatefulWidget> createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  bool _hasName = false;
  bool _hasPhoto = false;
  bool _hasIngredients = false;
  bool _hasSteps = false;

  Recipe _recipe = Recipe(
    id: -1,
    name: "",
    duration: 0,
    photo: "",
    recipeIngredients: [],
    recipeSteps: [],
  );

  final GlobalKey<FormState> _nameFormKey = GlobalKey();

  void _submit(BuildContext context) {
    final bloc = context.read<RecipeBloc>();
    bloc.add(RecipesAddEvent(_recipe));
    Navigator.pop(context, true);
  }

  void _validateName(String? value) {
    final hasName = _nameFormKey.currentState?.validate() ?? false;

    if (hasName) {
      setState(() {
        _recipe = _recipe.copyWith(name: value);
        _hasName = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;
    final l10 = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10.newRecipe, style: textScheme.headlineLarge),
        ),
        body: Layout(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 17, 15, 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  RecipeNameForm(
                    formKey: _nameFormKey,
                    onChanged: _validateName,
                  ),
                  RecipePicture(
                    onImageSelected: (String? path) {
                      setState(() {
                        _recipe = _recipe.copyWith(photo: path);
                        _hasPhoto = true;
                      });
                    },
                  ),
                  RecipeIngredients(
                    recipeIngredients: _recipe.recipeIngredients,
                    onAddIngredient: (RecipeIngredient ingredient) {
                      setState(() {
                        _recipe.recipeIngredients.add(ingredient);
                        _hasIngredients = true;
                      });
                    },
                    onEditIngredient: (RecipeIngredient ingredient) {
                      setState(() {
                        _recipe = _recipe.copyWith(
                          ingredients: _recipe.recipeIngredients.map((i) {
                            if (i.id != ingredient.id) {
                              return i;
                            }

                            return ingredient;
                          }).toList(),
                        );
                      });
                    },
                    onDeleteIngredient: (RecipeIngredient ingredient) {
                      setState(() {
                        _recipe.recipeIngredients.removeWhere(
                          (i) => i.id == ingredient.id,
                        );
                        if (_recipe.recipeIngredients.isEmpty) {
                          _hasIngredients = false;
                        }
                      });
                    },
                  ),
                  RecipeSteps(
                    steps: _recipe.recipeSteps,
                    onAddStep: (RecipeStepLink step) {
                      setState(() {
                        _recipe = _recipe.copyWith(
                          steps: [..._recipe.recipeSteps, step],
                        );
                        _hasSteps = true;
                      });
                    },
                    onEditStep: (RecipeStepLink step) {
                      setState(() {
                        _recipe = _recipe.copyWith(
                          steps: _recipe.recipeSteps.map((s) {
                            if (s.id != step.id) {
                              return s;
                            }

                            return step;
                          }).toList(),
                        );
                      });
                    },
                    onDeleteStep: (RecipeStepLink step) {
                      setState(() {
                        _recipe.recipeSteps.removeWhere((i) => i.id == step.id);
                      });
                      if (_recipe.recipeSteps.isEmpty) {
                        _hasSteps = false;
                      }
                    },
                  ),
                  Center(
                    child: FilledButton(
                      onPressed:
                          _hasName && _hasPhoto && _hasIngredients && _hasSteps
                              ? () => _submit(context)
                              : null,
                      child: Text(l10.saveRecipe),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
