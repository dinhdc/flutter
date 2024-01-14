import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/cagegories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activatePage = const CategoriesScreen();
    var activatePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activatePage = const MealsScreen(meals: []);
      activatePageTitle = "Your Favorite";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activatePageTitle),
      ),
      body: activatePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
        ],
        onTap: _selectPage,
      ),
    );
  }
}
