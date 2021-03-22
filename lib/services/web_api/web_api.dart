import 'package:pexels/models/photo.dart';

abstract class WebApi {
  Future <bool> isInternet();
  Future <List<Photo>> fetchPhotos();
  Future <List<Photo>> fetchNextPhotos(int page);
}