import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.18,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.8 / 2.5, //  width/height
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: kPrimaryColor, // takes the scaffold background color
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.book1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Harry Potter and the Goblet of Fire",
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "J.K. Rowling",
                    style: Styles.textStyle14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "19.99\$",
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.w900),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
