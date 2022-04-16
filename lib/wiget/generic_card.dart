import 'package:bookwalay/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:bookwalay/const.dart';


class CardWidget extends StatelessWidget {
  CardWidget(
      {Key? key,
      required this.httpResponseData,
      required this.index,
      required this.productName,
      required this.price,
      required this.rating,
      required this.openContainer})
      : super(key: key);
  final List<CardModel>? httpResponseData;
  final int index;
  final VoidCallback openContainer;
  final String productName;
  final int price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openContainer,
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0)),
                    child: FadeInImage(
                      placeholder: AssetImage(baseIconDir + "default.png"),
                      image: NetworkImage(httpResponseData![index].url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.white70,
                    child: (httpResponseData![index].albumId % 2 == 0)
                        ? const Icon(
                            Icons.favorite,
                            size: 20.0,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite,
                            size: 20.0,
                            color: Colors.grey,
                          ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5.0, top: 170.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(2.0),
                        bottomRight: Radius.circular(2.0),
                      ),
                    ),
                    width: 50.0,
                    height: 20.0,
                    child: Row(
                      children: [
                        Text(
                          " $rating",
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Icon(
                          Icons.star,
                          size: 15.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                " $productName",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                "₹$price",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}