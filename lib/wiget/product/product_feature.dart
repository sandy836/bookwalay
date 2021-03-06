import 'package:flutter/material.dart';

class ProductFeatureWidget extends StatelessWidget {
  const ProductFeatureWidget({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productOffpercent,
  }) : super(key: key);

  final int productPrice;
  final String productName;
  final double productOffpercent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "$productName",
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
              color: Colors.grey[300],
              child: Text(
                "₹${(productPrice - (productPrice * productOffpercent)).ceil()}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              "$productPrice",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2.0,
                  decorationColor: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              "${(productOffpercent * 100).ceil()}% off",
              style: const TextStyle(color: Colors.green),
            )
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          child: const Text(
            "Hurry, Only few left!",
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }
}
