import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.18),
          child: const CustomBookImage(imageUrl: 'https://imgd.aeplcdn.com/642x361/cw/ec/33282/MercedesBenz-GClass-Exterior-120349.jpg?wm=1&q=80',),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'The Jungle Book',
          style: Styles.textStyle20
              .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 2,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Author Name',
            style: Styles.textStyle16.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 14,
        ),
        const BooksAction(),
      ],
    );
  }
}
