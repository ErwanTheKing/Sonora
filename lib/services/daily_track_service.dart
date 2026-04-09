import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonora/models/track.dart';
import 'package:sonora/services/track_data.dart';

class DailyTrackService {
  static const String _dateKey = 'daily_track_date';
  static const String _indexKey = 'daily_track_index';

  Future<Track> getDailyTrack() async {
    final prefs = await SharedPreferences.getInstance();

    final today = _formatDate(DateTime.now());

    final savedDate = prefs.getString(_dateKey);
    final savedIndex = prefs.getInt(_indexKey);

    if (savedDate == today &&
        savedIndex != null &&
        savedIndex >= 0 &&
        savedIndex < sampleTracks.length) {
      return sampleTracks[savedIndex];
    }

    final now = DateTime.now();

    final daySeed =
        now.year * 1000 + now.month * 100 + now.day;

    final newIndex = daySeed % sampleTracks.length;

    await prefs.setString(_dateKey, today);
    await prefs.setInt(_indexKey, newIndex);

    return sampleTracks[newIndex];
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}