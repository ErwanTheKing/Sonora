import 'package:flutter/material.dart';
import 'package:sonora/models/track.dart';
import 'package:sonora/services/favorites_service.dart';
import 'package:sonora/services/track_data.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesService _favoritesService = FavoritesService();

  List<Track> _favoriteTracks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favoriteIds = await _favoritesService.getFavoriteTrackIds();

    final favoriteTracks = sampleTracks
        .where((track) => favoriteIds.contains(track.id))
        .toList();

    setState(() {
      _favoriteTracks = favoriteTracks;
      _isLoading = false;
    });
  }

  Future<void> _removeFavorite(String trackId) async {
    await _favoritesService.removeFavorite(trackId);
    await _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : _favoriteTracks.isEmpty
          ? const Center(
        child: Text(
          'No favorite songs yet',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _favoriteTracks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final track = _favoriteTracks[index];

          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/logo.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(track.title),
              subtitle: Text('${track.artist} • ${track.genre}'),
              trailing: IconButton(
                onPressed: () => _removeFavorite(track.id),
                icon: const Icon(Icons.favorite),
              ),
            ),
          );
        },
      ),
    );
  }
}