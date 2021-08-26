import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/main_drawer.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import '../models/meals.dart';

class tabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  tabsScreen(this.favoriteMeals);
  @override
  _tabsScreenState createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {
  late List<Map<String, Object>> pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    pages = [
      {'page': categories_screen(), 'title': 'Categories'},
      {
        'page': favoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pages[_selectedPageIndex]['title'].toString()),
        ),
        drawer: MainDrawer(),
        body: pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black54,
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text('Catergories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                title: Text('Favorites')),
          ],
        ),
      ),
    );
  }
}
