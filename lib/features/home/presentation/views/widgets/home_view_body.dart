
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 8,
      ),
      child: Column(
        // children of column should have an identifing height , so you should identify hight for the widget or make it expanded
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Best Seller',
            // copyWith: create an instance from titleMedium and modify it 
            style: Styles.textStyle18,
          ),
          SizedBox(height: 10,),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 140,
      child:  Row(
        children: [
          InitImageSorted(),
        ],
      ),
    );
  }
}

class InitImageSorted extends StatelessWidget {
  const InitImageSorted({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5 / 2, //  width/height
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor, // takes the scaffold background color
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.book2),
          ),
        ),
      ),
    );
  }
}
