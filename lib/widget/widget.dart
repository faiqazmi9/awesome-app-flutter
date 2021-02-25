import 'package:awesome_app/model/item_models.dart';
import 'package:awesome_app/views/detail_image.dart';
import 'package:flutter/material.dart';

Widget BrandName() {
  return Row(
    children: [
      Text(
        "Awesome",
        style: TextStyle(color: Colors.red),
      ),
      Text(
        "App",
        style: TextStyle(color: Colors.grey),
      )
    ],
  );
}

Widget itemImages(List<ItemModels> itemImages, context, int count, double size) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: count,
      physics: ClampingScrollPhysics(),
      childAspectRatio: size,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: itemImages.map((item) {
        return GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailImage(
                                imgUrl: item.src.original,
                                photographer: item.photographer,
                                photographerUrl: item.photographerUrl,
                              )));
                },
                child: Hero(
                  tag: item.src.original,
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          item.src.small,
                          fit: BoxFit.cover,
                        )),
                  ),
                )));
      }).toList(),
    ),
  );
}
