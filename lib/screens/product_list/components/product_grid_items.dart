import 'package:flutter/material.dart';
import 'package:pexels/screens/components/components.dart';
import 'package:pexels/screens/product_list/product_list_provider.dart';
import 'package:provider/provider.dart';

class ProductGridItems extends StatelessWidget {
  const ProductGridItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ProductListProvider>(
      builder: (context, provider, child) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final photo = provider.photos[index];
          return Container(
            padding: EdgeInsets.all(10.0),
            width: size.width / 2,
            height: size.width / 2,
            child: Column(
              children: [
                Container(
                  height: size.width / 2,
                  child: AppNetworkImage(
                    imageUrl: photo.src.thumbImage,
                    borderRadius: 10.0,
                  ),
                ),
                Flexible(
                  child: Container(
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
          );
        },
      ),
    );
  }
}