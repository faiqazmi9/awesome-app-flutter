import 'dart:convert';

import 'package:awesome_app/data/data.dart';
import 'package:awesome_app/model/item_models.dart';
import 'package:awesome_app/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ItemModels> items = new List();

  fetchImage() async {
    var response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=15",
        headers: {"Authorization": apiKey});
    //print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      ItemModels itemModels = new ItemModels();
      itemModels = ItemModels.formMap(element);
      items.add(itemModels);
    });

    setState(() {});
  }

  @override
  void initState() {
    fetchImage();
    super.initState();
  }

  void refreshState(int count, double size) {
    itemImages(items, context, count, size);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.pexels.com/photos/2792157/pexels-photo-2792157.jpeg',
                fit: BoxFit.cover,
              ),
              title: BrandName(),
              collapseMode: CollapseMode.parallax,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.grid_view),
                onPressed: () {
                  refreshState(2, 0.6);
                },
              ),
              IconButton(
                icon: Icon(Icons.list_alt),
                onPressed: () {
                  refreshState(1, 1.6);
                },
              ),
              SizedBox(
                width: 12,
                height: 12,
              )
            ],
          ),
          viewImages()
        ],
      ),
    );
  }

  Widget viewImages() => SliverToBoxAdapter(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              itemImages(items, context, 2, 0.6)
            ],
          ),
        ),
      );
}
