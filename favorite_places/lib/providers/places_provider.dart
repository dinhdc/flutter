import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
    return db.execute(
        'create table user_places(id text primary key, name text, image text, lat REAL, long REAL, address text)');
  }, version: 1);
  return db;
}

class PlaceListNotifier extends StateNotifier<List<Place>> {
  PlaceListNotifier() : super([]);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final places = data.map((row) => Place(
        id: row["id"] as String,
        image: File(row['image'] as String),
        name: row['name'] as String,
        location: PlaceLocation(
            latitude: row['lat'] as double,
            longitude: row['long'] as double,
            address: row['address'] as String))).toList();
    state = places;
  }

  void addNewPlace(Place place) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(place.image.path);
    final copiedImage = await place.image.copy('${appDir.path}/$filename');
    place.image = copiedImage;
    final db = await _getDatabase();
    db.insert('user_places', {
      'id': place.id,
      'title': place.name,
      'image': place.image.path,
      'lat': place.location.latitude,
      'long': place.location.longitude,
      'address': place.location.address,
    });
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
