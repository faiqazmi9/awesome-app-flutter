import 'package:flutter/material.dart';

class DetailImage extends StatefulWidget {
  final String imgUrl;
  final String photographer;
  final String photographerUrl;

  DetailImage(
      {@required this.imgUrl,
      @required this.photographer,
      @required this.photographerUrl});

  @override
  _DetailImageState createState() => _DetailImageState();
}

class _DetailImageState extends State<DetailImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.photographer,
                  style: TextStyle(
                      color: Colors.white, backgroundColor: Colors.black),
                ),
                Text(
                  widget.photographerUrl,
                  style: TextStyle(
                      color: Colors.white, backgroundColor: Colors.black),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
