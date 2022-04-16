import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageContainer extends StatefulWidget {
  String imagesName = "";
  String baseImageDir = "";
  ImageContainer(
      {Key? key, required this.imagesName, required this.baseImageDir}) : super(key: key);
  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: AssetImage(widget.baseImageDir + widget.imagesName),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}