import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
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
      child: CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: BestSellerListView(),
          )
        ],
      ),
    );
  }
}
