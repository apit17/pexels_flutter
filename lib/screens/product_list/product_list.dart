import 'package:flutter/material.dart';
import 'package:pexels/screens/product_list/components/components.dart';
import 'package:pexels/screens/components/components.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({Key key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CollapseAppBar(),
          ];
        },
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ProductItem();
          },
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
              child: AppNetworkImage(
                imageUrl:
                    "https://images.pexels.com/photos/2645435/pexels-photo-2645435.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
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
                      "Reafes Gates",
                      maxLines: 2,
                      style: PexelTextStyle.titleStyle(),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "https://www.pexels.com/@reafonbgateshttps://www.pexels.com/@reafonbgates",
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
