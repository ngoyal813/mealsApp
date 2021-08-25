import 'package:flutter/material.dart';
import '../screens/categories_item_screen.dart';

class categoryItem extends StatelessWidget {
  final String id;
  final String Title;
  final Color color;

  categoryItem(this.Title, this.color, this.id);

  void screenchanger(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(categoryItemScreen.routeName,
        arguments: {'id': id, 'title': Title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => screenchanger(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          Title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
