import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widgets/meals_item.dart';

class categoryItemScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeargs['title'];
    final id = routeargs['id'];
    final category_meals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return meal_item(
              id: category_meals[index].id,
              title: category_meals[index].title,
              imageUrl: category_meals[index].imageUrl,
              complexity: category_meals[index].complexity,
              duration: category_meals[index].duration,
              affordability: category_meals[index].affordability);
        },
        itemCount: category_meals.length,
      ),
    );
  }
}
