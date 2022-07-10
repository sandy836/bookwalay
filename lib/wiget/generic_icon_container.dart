import 'package:bookwalay/activity/generic_gridView.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenericIconContainer extends StatefulWidget {
  String imagesName = "";
  String baseImageDir = "";
  String iconName = "";
  GenericIconContainer(
      {Key? key,
      required this.imagesName,
      required this.baseImageDir,
      required this.iconName}) : super(key: key);
  @override
  _GenericIconContainerState createState() => _GenericIconContainerState();
}

class _GenericIconContainerState extends State<GenericIconContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Ink.image(
            image: AssetImage(widget.baseImageDir + widget.imagesName),
            fit: BoxFit.cover,
            width: 50.0,
            height: 50.0,
            child: InkWell(
              splashColor: Colors.white70,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenericGridView(),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          widget.iconName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
        )
      ],
    );
  }
}