import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_item_widget.dart';
import 'package:shopping_list/widgets/new_grocery_item.dart';

class GroceryListWidget extends StatefulWidget {
  const GroceryListWidget({super.key});

  @override
  State<GroceryListWidget> createState() => _GroceryListWidgetState();
}

class _GroceryListWidgetState extends State<GroceryListWidget> {
  final List<GroceryItem> _groceryItems = [];

  void _addNewItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewGroceryWidget()));
    if (newItem == null) return;
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeNewItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No Item added yet.'),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) => GroceryItemWidget(
            groceryItem: _groceryItems[index], onRemoveItem: _removeNewItem),
        itemCount: _groceryItems.length,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
                onPressed: () {
                  _addNewItem(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}
