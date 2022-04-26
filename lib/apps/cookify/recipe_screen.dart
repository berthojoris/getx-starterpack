import 'package:digital/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'models/full_recipe.dart';

class CookifyRecipeScreen extends StatefulWidget {
  @override
  _CookifyRecipeScreenState createState() => _CookifyRecipeScreenState();
}

class _CookifyRecipeScreenState extends State<CookifyRecipeScreen> {
  late FullRecipe recipe;
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    recipe = FullRecipe.getSingle();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: theme.colorScheme.onBackground,
            ),
          ),
          actions: [
            Icon(
              Icons.favorite_border,
              color: customTheme.cookifyPrimary,
            ),
            FxSpacing.width(16)
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: customTheme.cookifyPrimary,
          label: FxText.b2("Watch Video",
              color: customTheme.cookifyOnPrimary, fontWeight: 600),
          icon: Icon(
            Icons.play_circle_fill,
            color: customTheme.cookifyOnPrimary,
          ),
        ),
        body: Container(
          color: theme.scaffoldBackgroundColor,
          child: ListView(
            padding: FxSpacing.fromLTRB(24, 4, 24, 0),
            children: [
              FxText.h3(recipe.title, fontWeight: 800, letterSpacing: -0.2),
              FxSpacing.height(8),
              FxText.b2(recipe.body,
                  color: theme.colorScheme.onBackground.withAlpha(140),
                  letterSpacing: 0,
                  fontWeight: 600),
              FxSpacing.height(24),
              Row(
                children: [
                  Column(
                    children: [
                      FxText.t1("Nutritions",
                          fontWeight: 700, letterSpacing: -0.2),
                      FxSpacing.height(16),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildNutritionList()),
                    ],
                  ),
                  FxSpacing.width(24),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image(
                        image: AssetImage(recipe.image),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              FxSpacing.height(24),
              FxText.t1("Ingredients", fontWeight: 700, letterSpacing: -0.2),
              FxSpacing.height(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildIngredientList(),
              ),
              FxSpacing.height(24),
              FxText.t1("Preparation", fontWeight: 700, letterSpacing: -0.2),
              FxSpacing.height(16),
              FxText.b2(recipe.preparation,
                  fontWeight: 500, letterSpacing: 0, muted: true),
              FxSpacing.height(80)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNutritionList() {
    List<Widget> list = [];
    for (int i = 0; i < recipe.nutritions.length; i++) {
      list.add(singleNutrition(recipe.nutritions[i]));
      if (i + 1 < recipe.nutritions.length) list.add(FxSpacing.height(16));
    }
    return list;
  }

  Widget singleNutrition(Nutrition nutrition) {
    return FxContainer(
      borderRadiusAll: 50,
      padding: FxSpacing.fromLTRB(8, 8, 12, 8),
      color: customTheme.cookifyPrimary.withAlpha(40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FxContainer.bordered(
              paddingAll: 4,
              width: 32,
              height: 32,
              borderRadiusAll: 16,
              color: customTheme.cookifyPrimary.withAlpha(200),
              border: Border.all(color: customTheme.cookifyPrimary, width: 1),
              child: Center(
                  child: FxText.b3(
                      FxTextUtils.doubleToString(
                        nutrition.unit,
                      ),
                      letterSpacing: 0,
                      color: customTheme.cookifyOnPrimary))),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.b3(nutrition.name, fontWeight: 600),
              FxText.b3(nutrition.unitType,
                  fontSize: 10, xMuted: true, fontWeight: 600),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> buildIngredientList() {
    List<Widget> list = [];
    for (Ingredient ingredient in recipe.ingredients) {
      list.add(FxText.b3(ingredient.ingredient,
          muted: true, height: 1.7, letterSpacing: 0));
    }
    return list;
  }
}