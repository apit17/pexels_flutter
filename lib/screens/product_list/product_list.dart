import 'package:flutter/material.dart';
import 'package:pexels/screens/product_list/components.dart';

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
            return Text("Test $index");
          },
        ),
      ),
    );
  }
}
