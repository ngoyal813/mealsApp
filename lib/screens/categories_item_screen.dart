import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import '../Widgets/meals_item.dart';

class categoryItemScreen extends StatefulWidget {
  static const routeName = '/category-meal';

  final List<Meal> availableMeals;
  categoryItemScreen(this.availableMeals);
  @override
  _categoryItemScreenState createState() => _categoryItemScreenState();
}

class _categoryItemScreenState extends State<categoryItemScreen> {
  String? title;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  didChangeDependencies() {
    if (!_loadedInitData) {
      final routeargs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      title = routeargs['title'].toString();
      final id = routeargs['id'];
      _loadedInitData = true;
      displayedMeals = widget.availableMeals.where((element) {
        return element.categories.contains(id);
      }).toList();
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return meal_item(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            complexity: displayedMeals![index].complexity,
            duration: displayedMeals![index].duration,
            affordability: displayedMeals![index].affordability,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
