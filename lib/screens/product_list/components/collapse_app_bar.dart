import 'package:flutter/material.dart';
import 'package:pexels/screens/components/components.dart';

class CollapseAppBar extends StatelessWidget {
  final String imageUrl;
  const CollapseAppBar({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var top = 0.0;
    return SliverAppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.grid_view),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.view_agenda_outlined),
          onPressed: () {},
        ),
      ],
      expandedHeight: 200.0,
      floating: true,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            centerTitle: false,
            title: Row(
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity:
                      top == MediaQuery.of(context).padding.top + kToolbarHeight
                          ? 1.0
                          : 0.0,
                  child: Text(
                    "Pexels App",
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
  }
}
