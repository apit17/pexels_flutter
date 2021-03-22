import 'package:flutter/foundation.dart';
import 'package:pexels/models/photo.dart';
import 'package:pexels/services/service_locator.dart';
import 'package:pexels/services/web_api/web_api.dart';
import 'package:pexels/services/web_api/web_api_service.dart';
import 'package:pexels/utils/response.dart';

class ProductListProvider extends ChangeNotifier {
  WebApi _webApi = serviceLocator<WebApi>();

  bool _isGridView = false;
  bool get isGridView => _isGridView;

  Response<bool> responseCase = Response<bool>();

  List<Photo> _photos;
  List<Photo> get photos => _photos;

  void _setResponseCase(Response response) {
    responseCase = response;
    notifyListeners();
  }

  void loadPhotos() async {
    _setResponseCase(Response.loading<bool>());
    try {
      final isInternet = await _webApi.isInternet();
      if (isInternet) {
        _webApi
          .fetchPhotos()
          .then((value) {
            _photos = value;
            _setResponseCase(Response.completed<bool>(true));
          });
      } else {
        _setResponseCase(Response.error<bool>("No Internet Connection"));
      }
    } on Failure catch (exception) {
      _setResponseCase(Response.error<bool>(exception.toString()));
    }
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
