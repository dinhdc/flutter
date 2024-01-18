import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/new_place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListScreen extends ConsumerStatefulWidget {
  const PlaceListScreen({super.key});

  @override
  ConsumerState<PlaceListScreen> createState() {
    return _PlaceListScreen();
  }
}

class _PlaceListScreen extends ConsumerState<PlaceListScreen> {
  late Future<void> _placesFeature;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placesFeature = ref.read(placeListNotifier.notifier).loadPlaces();
  }

  void _openNewPlace(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewPlaceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final myPlaces = ref.watch(placeListNotifier);

    Widget content = Center(
      child: Text(
        'No places added yet.',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );

    if (myPlaces.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(myPlaces[index].image),
          ),
          title: Text(myPlaces[index].name,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          subtitle: Text(myPlaces[index].location.address,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => PlaceDetailScreen(place: myPlaces[index])));
          },
        ),
        itemCount: myPlaces.length,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                _openNewPlace(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFeature,
          builder: ((context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : content),
        ),
      ),
    );
  }
}
