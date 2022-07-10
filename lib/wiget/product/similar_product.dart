import 'package:bookwalay/wiget/custom_circular_progess.dart';
import 'package:bookwalay/service/card_service.dart';
import 'package:flutter/material.dart';
import 'package:bookwalay/wiget/generic_listView.dart';

class SimilarProductWidget extends StatelessWidget {
  final String productType;
  const SimilarProductWidget({Key? key, required this.productType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const CustomCircularProgressWidget();
          } else {
            return GenericListView(cardModel: snapshot.data, align: 1);
          }
        },
      ),
    );
  }
}
