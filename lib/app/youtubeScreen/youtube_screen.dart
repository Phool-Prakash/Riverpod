
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/app/youtubeScreen/youtube_controller.dart';

class YouTubeVideosScreen extends ConsumerWidget {
  final String channelId = 'UCCtzn8jmWvU0_5EB7yfU6AQ';

  const YouTubeVideosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final youtubeState = ref.watch(youtubeControllerProvider);
    final youtubeController = ref.read(youtubeControllerProvider.notifier);
    print('Scaf');
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Channel Videos'),
      ),
      body: youtubeState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : youtubeState.errorMessage.isNotEmpty
          ? Center(child: Text('Error: ${youtubeState.errorMessage}'))
          : youtubeState.videos.isEmpty
          ? Center(child: Text('No videos found'))
          : ListView.builder(
        itemCount: youtubeState.videos.length,
        itemBuilder: (context, index) {
          final video = youtubeState.videos[index];
          final videoId = video['id']['videoId'];
          final videoTitle = video['snippet']['title'];

          return Card(
            child: Column(
              children: [
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoId,
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(videoTitle),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
