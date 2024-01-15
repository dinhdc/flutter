import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryItemWidget extends StatelessWidget {
  const GroceryItemWidget(
      {super.key, required this.groceryItem, required this.onRemoveItem});

  final GroceryItem groceryItem;
  final void Function(GroceryItem item) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        onRemoveItem(groceryItem);
      },
      key: ValueKey(groceryItem.id),
      child: ListTile(
        title: Text(groceryItem.name),
        leading: Container(
          height: 24,
          width: 24,
          color: groceryItem.category.color,
        ),
        trailing: Text(groceryItem.quantity.toString()),
      ),
    );
  }
}
