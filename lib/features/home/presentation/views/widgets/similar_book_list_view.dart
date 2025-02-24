import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height * 0.15, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(imageUrl: 'https://imgd.aeplcdn.com/642x361/cw/ec/33282/MercedesBenz-GClass-Exterior-120349.jpg?wm=1&q=80'), // Assuming this is a custom widget
          );
        },
      ),
    );
  }
}
