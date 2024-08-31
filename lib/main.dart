import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_flutter/app/CourseApp/mainScreen.dart';
import 'package:riverpod_flutter/providers/counterProvider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

//StateProvider that holds an int val
final counterProvider = StateProvider<int>((ref)=>1);

//Multiplier provider
final multiProvider = Provider<int>((ref)=>2);

final counterProvider1 = StateNotifierProvider<CounterNotifier,int>((ref){
  final multiplier = ref.watch(multiProvider);
  return CounterNotifier(multiplier);
});


class CounterNotifier extends StateNotifier<int>{
  final int multiplier;

  CounterNotifier(this.multiplier):super(0);

  void increment()=> state += multiplier;
}
void main() {
  test("Counter increments correctly",(){

    //ProviderContainer to manage providers
    final containers = ProviderContainer(
      overrides: [
        multiProvider.overrideWithValue(3),
      ]
    );

    //Read initial value of the counter
    expect(containers.read(counterProvider),1);

    //Multiply the counter
    containers.read(counterProvider.notifier).state +=2;

    //Read value after Multiply
    expect(containers.read(counterProvider), 3);

    expect(containers.read(multiProvider), 3);
  });
  runApp(const CourseApp());
  // runApp(const ProviderScope(child: App1()));
}

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     const String titleText = 'RiverPod';
//     final counter = ref.watch(counterProvider);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(titleText),
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: Text(
//                 '$counter',
//                 style: const TextStyle(fontSize: 30),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             IconButton(
//                 onPressed: () => ref.read(counterProvider.notifier).state--,
//                 icon: const Icon(Icons.exposure_minus_1))
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () => ref.read(counterProvider.notifier).state++),
//         bottomNavigationBar: BottomNavigationBar(items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'Favorite'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
//         ]),
//       ),
//     );
//   }
// }
//
// class App1 extends StatelessWidget {
//   const App1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: YouTubeVideosScreen(),
//         );
//   }
// }
//
//
//
// class YouTubeVideosScreen extends StatelessWidget {
//   final String channelId = 'UCCtzn8jmWvU0_5EB7yfU6AQ';
//   final String apiKey = 'AIzaSyDRnQ98WnlfFpyty_X1RMWHnKHtggtZKDM';
//
//   const YouTubeVideosScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('YouTube Channel Videos'),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: fetchYouTubeVideos(channelId, apiKey),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final videos = snapshot.data;
//             return ListView.builder(
//               itemCount: videos!.length,
//               itemBuilder: (context, index) {
//                 final video = videos[index];
//                 final videoId = video['id']['videoId'];
//                 final videoTitle = video['snippet']['title'];
//
//                 return Card(
//                   child: Column(
//                     children: [
//                       YoutubePlayer(
//                         controller: YoutubePlayerController(
//                           initialVideoId: videoId,
//                           flags: const YoutubePlayerFlags(
//                             autoPlay: false,
//                             mute: false,
//                           ),
//                         ),
//                       ),
//                       ListTile(
//                         title: Text(videoTitle),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
//   Future<List<dynamic>> fetchYouTubeVideos(String channelId, String apiKey) async {
//     final String url = 'https://www.googleapis.com/youtube/v3/search?key=$apiKey&channelId=$channelId&part=snippet&type=video&order=date&maxResults=20';
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       final Map<String, dynamic> data = json.decode(response.body);
//       print(data);
//       return data['items'];
//     } else {
//       throw Exception('Failed to load videos');
//     }
//   }
// }


class CourseApp extends StatelessWidget {
  const CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
