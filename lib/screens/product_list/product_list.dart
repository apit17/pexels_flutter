import 'package:flutter/material.dart';
import 'package:pexels/screens/product_list/components/components.dart';
import 'package:pexels/screens/product_list/product_list_provider.dart';
import 'package:pexels/services/service_locator.dart';
import 'package:pexels/utils/response.dart';
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
          body: setupLayout(),
        ),
      ),
    );
  }

  Widget setupLayout() {
    switch (provider.responseCase.state) {
      case ResponseState.Loading:
        return LoadingScreen();
      case ResponseState.Completed:
        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
        );
      case ResponseState.Error:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(provider.responseCase.exception),
              TextButton(
                onPressed: () {
                  provider.loadPhotos();
                },
                child: Text(
                  "Retry",
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        );
    }
    return Container();
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 8,
          ),
          Text(
            'Loading...',
            style: TextStyle(fontFamily: 'Roboto'),
          )
        ],
      ),
    ));
  }
}
