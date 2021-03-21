import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pexels/constants/constants.dart';
import 'package:pexels/models/photo.dart';
import 'package:pexels/services/web_api/web_api.dart';

class WebApiService implements WebApi {
  final _host = "api.pexels.com";
  final _path = "v1/curated";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "Authorization": apiKey,
  };

  List<Photo> _photoCache;

  @override
  Future<List<Photo>> fetchPhotos() async {
    if (_photoCache == null) {
      print("get from web");
      final parameter = {"per_page": "10"};
      final uri = Uri.https(_host, _path, parameter);
      final result = await http.get(uri, headers: _headers);
      final jsonObject = json.decode(result.body);
      _photoCache = _createPhotosFromRawMap(jsonObject);
    } else {
      print("get from cache");
    }
    return _photoCache;
  }

  @override
  Future<List<Photo>> fetchNextPhotos(int page) async {
    if (_photoCache == null) {
      print("get from web");
      final parameter = {"per_page": "10", "page": "$page"};
      final uri = Uri.https(_host, _path, parameter);
      final result = await http.get(uri, headers: _headers);
      final jsonObject = json.decode(result.body);
      final photos = _createPhotosFromRawMap(jsonObject);
      _photoCache = _photoCache + photos;
    } else {
      print("get from cache");
    }
    return _photoCache;
  }

  List<Photo> _createPhotosFromRawMap(Map jsonObject) {
    final photos = jsonObject["photos"];

    List<Photo> list = [];

    for (var photo in photos) {
      list.add(Photo.fromJson(photo));
    }
    return list;
  }
}
