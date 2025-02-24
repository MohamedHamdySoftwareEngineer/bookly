import 'package:flutter/material.dart';

import '../../../../../constants.dart';


class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 2, //  width/height
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor, // takes the scaffold background color
          image:  DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
