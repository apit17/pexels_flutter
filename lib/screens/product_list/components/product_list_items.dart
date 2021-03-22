import 'package:flutter/material.dart';
import 'package:pexels/screens/components/components.dart';
import 'package:pexels/screens/product_detail/product_detail.dart';
import 'package:pexels/screens/product_list/product_list_provider.dart';
import 'package:provider/provider.dart';

class ProductListItems extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListProvider>(
      builder: (context, provider, child) => ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index < provider.photosCount) {
            final photo = provider.photos[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      product: photo,
                    ),
                  ),
                );
              },
              child: Container(
                height: 100.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        child: AppNetworkImage(
                          imageUrl: photo.src.thumbImage,
                          borderRadius: 6.0,
                        ),
                        width: 80.0,
                        height: 80.0,
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                photo.photographer,
                                maxLines: 2,
                                style: PexelTextStyle.titleStyle(),
                              ),
                              SizedBox(height: 10),
                              Text(
                                photo.photographerUrl,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            provider.loadNextPhotos();
            return Center(child: CircularProgressIndicator());
          }
        },
        itemCount: provider.photosCount + 1,
      ),
    );
  }
}
