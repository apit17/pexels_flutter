import 'package:flutter_test/flutter_test.dart';
import 'package:pexels/models/photo.dart';
import 'package:pexels/screens/product_list/product_list_provider.dart';
import 'package:pexels/services/service_locator.dart';
import 'package:pexels/services/web_api/web_api.dart';

class MockAPI extends WebApi {
  @override
  Future<List<Photo>> fetchNextPhotos(int page) {
    return Future.value([
      Photo(
        2772918,
        "Golnar  sabzpoush rashidi",
        "https://www.pexels.com/@golnar-sabzpoush-rashidi-1317651",
        PhotoSrc(
          "https://images.pexels.com/photos/2772918/pexels-photo-2772918.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "https://images.pexels.com/photos/2772918/pexels-photo-2772918.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
        ),
      ),
      Photo(
        2698080,
        "Reafon Gates",
        "https://www.pexels.com/@reafonbgates",
        PhotoSrc(
          "https://images.pexels.com/photos/2698080/pexels-photo-2698080.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "https://images.pexels.com/photos/2698080/pexels-photo-2698080.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
        ),
      )
    ]);
  }

  @override
  Future<List<Photo>> fetchPhotos() {
    return Future.value([
      Photo(
        2772918,
        "Golnar  sabzpoush rashidi",
        "https://www.pexels.com/@golnar-sabzpoush-rashidi-1317651",
        PhotoSrc(
          "https://images.pexels.com/photos/2772918/pexels-photo-2772918.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "https://images.pexels.com/photos/2772918/pexels-photo-2772918.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
        ),
      ),
      Photo(
        2698080,
        "Reafon Gates",
        "https://www.pexels.com/@reafonbgates",
        PhotoSrc(
          "https://images.pexels.com/photos/2698080/pexels-photo-2698080.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "https://images.pexels.com/photos/2698080/pexels-photo-2698080.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
        ),
      ),
      Photo(
        2698080,
        "Reafon Gates",
        "https://www.pexels.com/@reafonbgates",
        PhotoSrc(
          "https://images.pexels.com/photos/2698080/pexels-photo-2698080.jpeg?auto=compress&cs=tinysrgb&h=650&w=940",
          "https://images.pexels.com/photos/2698080/pexels-photo-2698080.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
        ),
      )
    ]);
  }

  @override
  Future<bool> isInternet() async {
    return true;
  }
}

void main() {
  setupServiceLocator();
  var productListProvider = serviceLocator<ProductListProvider>();
  productListProvider.webApi = MockAPI();

  group("Given Photo List Page Loads", () {
    test("Page should load a list of photos from Pexels API", () async {
      await productListProvider.loadPhotos();

      expect(productListProvider.photos.length, 2);

      expect(productListProvider.photos[0].id, 2698080);
      expect(productListProvider.photos[1].id, 2698080);
    });
  });
}
