import 'package:flutter/foundation.dart';
import 'package:pexels/models/photo.dart';
import 'package:pexels/services/service_locator.dart';
import 'package:pexels/services/web_api/web_api.dart';
import 'package:pexels/services/web_api/web_api_service.dart';
import 'package:pexels/utils/response.dart';

class ProductListProvider extends ChangeNotifier {
  WebApi webApi = serviceLocator<WebApi>();

  bool _isGridView = false;
  bool get isGridView => _isGridView;

  Response<bool> responseCase = Response<bool>();

  List<Photo> _photos;
  List<Photo> get photos => _photos;

  Photo _cover;
  Photo get cover => _cover;

  int get photosCount => _photos != null ? _photos.length : 0;

  int _page = 1;

  void _setResponseCase(Response response) {
    responseCase = response;
    notifyListeners();
  }

  Future loadPhotos() async {
    _setResponseCase(Response.loading<bool>());
    try {
      final isInternet = await webApi.isInternet();
      if (isInternet) {
        final value = await webApi.fetchPhotos();
        _cover = value.first;
        value.removeAt(0);
        _photos = value;
        _setResponseCase(Response.completed<bool>(true));
      } else {
        _setResponseCase(Response.error<bool>("No Internet Connection"));
      }
    } on Failure catch (exception) {
      _setResponseCase(Response.error<bool>(exception.toString()));
    }
    notifyListeners();
  }

  void loadNextPhotos() async {
    final isInternet = await webApi.isInternet();
    _page += 1;
    if (isInternet) {
      webApi.fetchNextPhotos(_page).then((value) {
        _photos = value;
        _setResponseCase(Response.completed<bool>(true));
      });
    } else {
      _setResponseCase(Response.error<bool>("No Internet Connection"));
    }
    notifyListeners();
  }

  void changeView() {
    _isGridView = !_isGridView;
    notifyListeners();
  }
}
