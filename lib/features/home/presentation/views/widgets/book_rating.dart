import '../../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start, required this.rating, required this.count});

  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4f),
          size: 15,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          // "4.8",
          "$rating",
          style: Styles.textStyle14,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          "($count)",
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
