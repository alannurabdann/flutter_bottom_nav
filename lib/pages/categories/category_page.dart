import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/categories/category_controller.dart';

class CategoryPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      //2
      SliverAppBar(
        expandedHeight: 220.0,
        floating: true,
        pinned: true,
        snap: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text("Title"),
          background: FadeInImage.assetNetwork(
            image:
                "https://images.unsplash.com/photo-1506617420156-8e4536971650?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1423&q=80",
            placeholder: "assets/images/category.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return SingleChildScrollView(
                child: ListView(
              padding: EdgeInsets.all(8),
              children: <Widget>[
                ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.green,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
                GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  }),
                )
              ],
            ));
          },
          childCount: 20,
        ),
      )
    ]));
  }
}
