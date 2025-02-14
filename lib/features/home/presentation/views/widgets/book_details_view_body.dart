import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.15),
            child: const CustomBookImage(),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'The Jungle Book',
            style: Styles.textStyle20
                .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2,
          ),
          Opacity(
            opacity: 0.7,
            child: Text(
              'Author Name',
              style: Styles.textStyle20.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const BookRating(mainAxisAlignment:  MainAxisAlignment.center,),
        ],
      ),
    );
  }
}
