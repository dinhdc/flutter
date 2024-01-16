import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListNotifier extends StateNotifier<List<Place>> {
  PlaceListNotifier() : super([]);

  void addNewPlace(Place place) {
    state = [...state, place];
  }

  void removeNewPlace(Place place) {
    state = state.where((p) => p.id != place.id).toList();
  }
}

final placeListNotifier =
    StateNotifierProvider<PlaceListNotifier, List<Place>>((ref) {
  return PlaceListNotifier();
});
