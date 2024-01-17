import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  final TextEditingController _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  void addNewPlace() {
    final name = _titleController.value.text.trim();
    if (name.isNotEmpty && _selectedImage != null) {
      ref.read(placeListNotifier.notifier).addNewPlace(Place(
          name: name, image: _selectedImage!, location: _selectedLocation!));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
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
          ImageInput(
            onPickImage: (image) {
              _selectedImage = image;
            },
          ),
          const SizedBox(
            height: 14,
          ),
          LocationInput(
            onSetLocation: (PlaceLocation location) {
              _selectedLocation = location;
            },
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
