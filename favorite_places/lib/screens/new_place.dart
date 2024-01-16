import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void addNewPlace() {
      final name = _titleController.value.text.trim();
      if (name.isNotEmpty) {
        ref.read(placeListNotifier.notifier).addNewPlace(Place(name: name));
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
            controller: _titleController,
            decoration: const InputDecoration(
                label: Text('Title'), fillColor: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: addNewPlace,
              icon: const Icon(Icons.add),
              label: const Text('Add place'))
        ]),
      ),
    );
  }
}
