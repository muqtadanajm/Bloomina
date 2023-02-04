import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/widgets/app_style.dart';

class FlowerItemTitle extends StatelessWidget {
  const FlowerItemTitle({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
  }) : super(
          key: key,
        );
  final String itemName, itemPrice, imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // item image
        Container(
          width: 100,
          height: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        // item name
        Text(itemName,
            style: mOswaldBold.copyWith(
                fontSize: 14, color: Color.fromARGB(255, 104, 104, 104))),
        // SizedBox(
        //   height: 5,
        // ),
        Text('\$' + itemPrice,
            style: mOswaldBold.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w900)),
        SizedBox(
          height: 10,
        ),
      ],
      // ),
    );
  }
}
