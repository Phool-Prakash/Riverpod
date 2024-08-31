// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';
// import 'package:riverpod_flutter/app/youtubeScreen/yt/yt_service.dart';
// class YoutubeScreen extends ConsumerWidget {
//   final String channelId;
//
//   const YoutubeScreen({required this.channelId});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final youtubeController = ref.watch(youtubeControllerProvider);
//
//     Future<void> loadVideos() async {
//       final videoIds = await YoutubeService.fetchVideoIds(channelId);
//       youtubeController.loadVideos(videoIds);
//     }
//
//     useEffect(() {
//       loadVideos();
//       return () {};
//     }, []);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My YouTube Videos'),
//       ),
//       body: ListView.builder(
//         itemCount: youtubeController.state.length,
//         itemBuilder: (context, index) {
//           final video = youtubeController.state[index];
//           return YoutubePlayerBuilder(
//             player: video,
//             builder: (context, player) => Container(
//               margin: const EdgeInsets.symmetric(vertical: 10),
//               child: player,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }