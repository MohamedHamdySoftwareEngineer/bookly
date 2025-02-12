import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  image: AssetImage(AssetsData.book2),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: const Text(
                  "Harry Potter and the Goblet of Fire",
                  style: Styles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.30,
                child: const Text(
                  "J.K. Rowling",
                  style: Styles.textStyle14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
                Row(
                children: [
                  Text(
                    "19.99\$",
                    style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w900),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
