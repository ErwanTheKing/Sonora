import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorite_track_ids';

  Future<List<String>> getFavoriteTrackIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  Future<bool> isFavorite(String trackId) async {
    final favorites = await getFavoriteTrackIds();
    return favorites.contains(trackId);
  }

  Future<void> addFavorite(String trackId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];

    if (!favorites.contains(trackId)) {
      favorites.add(trackId);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  Future<void> removeFavorite(String trackId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];

    favorites.remove(trackId);
    await prefs.setStringList(_favoritesKey, favorites);
  }

  Future<void> toggleFavorite(String trackId) async {
    final isFav = await isFavorite(trackId);

    if (isFav) {
      await removeFavorite(trackId);
    } else {
      await addFavorite(trackId);
    }
  }
}