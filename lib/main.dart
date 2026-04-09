import 'package:flutter/material.dart';
import 'package:sonora/models/track.dart';
import 'package:sonora/screens/today_screen.dart';
import 'package:sonora/services/daily_track_service.dart';

void main() {
  runApp(const SonoraApp());
}

class SonoraApp extends StatelessWidget {
  const SonoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sonora',
      debugShowCheckedModeBanner: false,
      home: const HomeLoader(),
    );
  }
}

class HomeLoader extends StatefulWidget {
  const HomeLoader({super.key});

  @override
  State<HomeLoader> createState() => _HomeLoaderState();
}

class _HomeLoaderState extends State<HomeLoader> {
  final DailyTrackService _dailyTrackService = DailyTrackService();

  Track? _dailyTrack;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDailyTrack();
  }

  Future<void> _loadDailyTrack() async {
    final track = await _dailyTrackService.getDailyTrack();

    setState(() {
      _dailyTrack = track;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_dailyTrack == null) {
      return const Scaffold(
        body: Center(
          child: Text('No track found'),
        ),
      );
    }

    return TodayScreen(track: _dailyTrack!);
  }
}