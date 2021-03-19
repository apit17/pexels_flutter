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
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ProductGridItems(), //ProductListItems(),
        ), 
      ),
    );
  }
}

class ProductListItems extends StatelessWidget {
  const ProductListItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
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
      },
    );
  }
}

class ProductGridItems extends StatelessWidget {
  const ProductGridItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: size.width / 2,
          height: size.width / 2,
          child: Column(
            children: [
              Container(
                height: size.width / 2,
                child: AppNetworkImage(
                  imageUrl:
                      "https://images.pexels.com/photos/2645435/pexels-photo-2645435.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280",
                  borderRadius: 10.0,
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
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
        );
      },
    );
  }
}
