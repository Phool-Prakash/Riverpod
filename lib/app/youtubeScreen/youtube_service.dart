import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:riverpod_flutter/app/youtubeScreen/yt_model.dart';
class YouTubeService {
  final String apiKey;

  YouTubeService(this.apiKey);

  Future<List<dynamic>> fetchYouTubeVideos(String channelId) async {
    print("Fetch Youtube videos");
    final String url =
        'https://www.googleapis.com/youtube/v3/search?key=$apiKey&channelId=$channelId&part=snippet&type=video&order=date&maxResults=20';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
// const CHANNEL_ID = 'UCsSOuRqp53B2y0-LgxLeXKw';
// const _baseUrl = 'www.googleapis.com';
// Future<ChannelInfo> getChannelInfo() async {
//   Map<String, String> parameters = {
//     'part': 'snippet,contentDetails,statistics',
//     'id': CHANNEL_ID,
//     'key': Constants.API_KEY,
//   };
//   Map<String, String> headers = {
//     HttpHeaders.contentTypeHeader: 'application/json',
//   };
//   Uri uri = Uri.https(
//     _baseUrl,
//     '/youtube/v3/channels',
//     parameters,
//   );
//   Response response = await http.get(uri, headers: headers);
// // print(response.body);
//   ChannelInfo channelInfo = channelInfoFromJson(response.body);
//   return channelInfo;
// }
