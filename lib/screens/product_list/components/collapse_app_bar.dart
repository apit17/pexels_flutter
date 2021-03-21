import 'package:flutter/material.dart';
import 'package:pexels/screens/components/components.dart';
import 'package:pexels/screens/product_list/product_list_provider.dart';
import 'package:provider/provider.dart';

class CollapseAppBar extends StatelessWidget {
  final String imageUrl;
  const CollapseAppBar({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var top = 0.0;
    return Consumer<ProductListProvider>(
      builder: (context, provider, child) {
        return SliverAppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.grid_view,
                color: provider.isGridView ? Colors.blueAccent : Colors.white,
              ),
              onPressed: () {
                provider.changeView();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.view_agenda_outlined,
                color: provider.isGridView ? Colors.white : Colors.blueAccent,
              ),
              onPressed: () {
                provider.changeView();
              },
            ),
          ],
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                centerTitle: false,
                title: Row(
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: top ==
                              MediaQuery.of(context).padding.top +
                                  kToolbarHeight
                          ? 1.0
                          : 0.0,
                      child: Text(
                        "Awesome App",
                        style: PexelTextStyle.titleStyle(),
                      ),
                    ),
                  ],
                ),
                background: AppNetworkImage(
                  imageUrl:
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                ),
              );
            },
          ),
        );
      },
    );
  }
}
