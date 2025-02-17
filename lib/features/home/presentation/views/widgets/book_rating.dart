import '../../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4f),
          size: 15,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "4.8",
          style: Styles.textStyle14,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "(2539)",
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
