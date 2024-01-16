import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_item_widget.dart';
import 'package:shopping_list/widgets/new_grocery_item.dart';

class GroceryListWidget extends StatefulWidget {
  const GroceryListWidget({super.key});

  @override
  State<GroceryListWidget> createState() => _GroceryListWidgetState();
}

class _GroceryListWidgetState extends State<GroceryListWidget> {
  List<GroceryItem> _groceryItems = [];
  String? _error;
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-prep-1f531-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list.json');
    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later';
        });
      }
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
      }
      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];
      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere((c) => c.value.name == item.value['category'])
            .value;
        loadedItems.add(GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category));
      }
      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'Something went wrong! Please try again later.';
      });
    }
  }

  void _addNewItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewGroceryWidget()));
    if (newItem == null) return;

    _loadItems();
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeNewItem(GroceryItem item) async {
    final url = Uri.https(
        'flutter-prep-1f531-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list/${item.id}.json');
    final response = await http.delete(url);
    if (response.statusCode < 400) {
      setState(() {
        _groceryItems.remove(item);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No Item added yet.'),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) => GroceryItemWidget(
            groceryItem: _groceryItems[index], onRemoveItem: _removeNewItem),
        itemCount: _groceryItems.length,
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
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
