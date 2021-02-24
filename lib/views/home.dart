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

    setState(() {

    });
  }

  @override
  void initState() {
    fetchImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: BrandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 16,),
              itemImages(items, context)
            ],
          ),
        ),
      ),
    );
  }
}
