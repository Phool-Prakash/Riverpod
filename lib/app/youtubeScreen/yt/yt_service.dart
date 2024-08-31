import 'package:http/http.dart' as http;
import 'dart:convert';

class YoutubeService {
  static Future<List<String>> fetchVideoIds(String channelId) async {
    const apiKey = 'YOUR_YOUTUBE_API_KEY';
    final url =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=$channelId&maxResults=50&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final videoIds =
          data['items'].map((item) => item['id']['videoId']).toList();
      return videoIds;
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
