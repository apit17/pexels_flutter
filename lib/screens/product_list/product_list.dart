import 'package:flutter/material.dart';
import 'package:pexels/screens/product_list/components/components.dart';
import 'package:pexels/screens/product_list/product_list_provider.dart';
import 'package:pexels/services/service_locator.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductListProvider provider = serviceLocator<ProductListProvider>();

  @override
  void initState() {
    super.initState();
    provider.loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductListProvider>(
      create: (context) => provider,
      child: Consumer<ProductListProvider>(
        builder: (context, provider, child) => Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                CollapseAppBar(),
              ];
            },
            body: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child:
                  provider.isGridView ? ProductGridItems() : ProductListItems(),
            ),
          ),
        ),
      ),
    );
  }
}
