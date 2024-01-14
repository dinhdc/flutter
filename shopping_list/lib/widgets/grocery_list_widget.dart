import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_item.dart';
import 'package:shopping_list/widgets/grocery_item_widget.dart';
import 'package:shopping_list/widgets/new_grocery_item.dart';

class GroceryListWidget extends StatefulWidget {
  const GroceryListWidget({super.key});

  @override
  State<GroceryListWidget> createState() => _GroceryListWidgetState();
}

class _GroceryListWidgetState extends State<GroceryListWidget> {
  void _addNewItem(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewGroceryWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _addNewItem(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) =>
            GroceryItemWidget(groceryItem: groceryItems[index]),
        itemCount: groceryItems.length,
      ),
    );
  }
}
