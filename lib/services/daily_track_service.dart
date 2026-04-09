import 'package:sonora/models/track.dart';
import 'package:sonora/services/track_data.dart';

class DailyTrackService {
  Track getDailyTrack() {
    final now = DateTime.now();

    final daySeed = now.year * 1000 + now.month * 100 + now.day;
    final index = daySeed % sampleTracks.length;

    return sampleTracks[index];
  }
}