
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/app/youtubeScreen/youtube_service.dart';

class YouTubeState {
  final List<dynamic> videos;
  final bool isLoading;
  final String errorMessage;

  YouTubeState({this.videos = const [], this.isLoading = false, this.errorMessage = ''});

  YouTubeState copyWith({
    List<dynamic>? videos,
    bool? isLoading,
    String? errorMessage,
  }) {
    return YouTubeState(
      videos: videos ?? this.videos,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class YouTubeController extends StateNotifier<YouTubeState> {
  final YouTubeService youtubeService;

  YouTubeController(this.youtubeService) : super(YouTubeState());

  Future<void> loadVideos(String channelId) async {
    print("Load function");
    state = state.copyWith(isLoading: true, errorMessage: '');

    try {
      final videos = await youtubeService.fetchYouTubeVideos(channelId);
      state = state.copyWith(videos: videos);
    } catch (error) {
      state = state.copyWith(errorMessage: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final youtubeControllerProvider = StateNotifierProvider<YouTubeController, YouTubeState>(
      (ref) => YouTubeController(YouTubeService('AIzaSyDRnQ98WnlfFpyty_X1RMWHnKHtggtZKDM')),
);