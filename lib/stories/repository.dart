import 'dart:convert';
import 'package:http/http.dart';

enum MediaType { image, video, text }

class InstaStories {
  final MediaType? mediaType;
  final String? media;
  final double? duration;
  final String? caption;
  final String? when;
  final String? color;

  InstaStories({
    this.mediaType,
    this.media,
    this.duration,
    this.caption,
    this.when,
    this.color,
  });
}
class Repository {
  static MediaType _translateType(String? type) {
    if (type == "image") {
      return MediaType.image;
    }

    if (type == "video") {
      return MediaType.video;
    }

    return MediaType.text;
  }

  static Future<List<InstaStories>> getInstaStories() async {
    const uri = "https://api.npoint.io/5b63e3cbcc5255a2e757";
    final response = await get(Uri.parse(uri));
    final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];

    final res = data.map<InstaStories>((it) {
      return InstaStories(
          caption: it['caption'],
          media: it['media'],
          duration: double.parse(it['duration']),
          when: it['when'],
          mediaType: _translateType(it['mediaType']),
          color: it['color']);
    }).toList();

    return res;
  }
}
