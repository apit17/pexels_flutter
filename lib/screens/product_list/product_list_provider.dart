import 'package:flutter/foundation.dart';
import 'package:pexels/models/photo.dart';
import 'package:pexels/services/service_locator.dart';
import 'package:pexels/services/web_api/web_api.dart';

class ProductListProvider extends ChangeNotifier {
  WebApi _webApi = serviceLocator<WebApi>();

  bool _isGridView = false;
  bool get isGridView => _isGridView;

  List<Photo> _photos;
  List<Photo> get photos => _photos;

  void loadPhotos() async {
    _photos = await _webApi.fetchPhotos();
    notifyListeners();
  }

  void loadNextPhotos(int page) async {
    _photos = await _webApi.fetchNextPhotos(page);
    notifyListeners();
  }

  void changeView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }
}