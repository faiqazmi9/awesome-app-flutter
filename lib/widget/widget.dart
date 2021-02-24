import 'package:awesome_app/model/item_models.dart';
import 'package:flutter/material.dart';

Widget BrandName() {
  return Row(
    children: [
      Text(
        "Awesome",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        "App",
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
}

Widget itemImages(List<ItemModels> itemImages, context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: itemImages.map((item) {
        return GridTile(
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
              item.src.small,
              fit: BoxFit.cover,
            )),
          ),
        );
      }).toList(),
    ),
  );
}
