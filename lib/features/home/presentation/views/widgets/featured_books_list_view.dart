import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom__loading__indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manger/features/featured_books/presentation/cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: screenHeight * 0.27,
            child: ListView.builder(
              
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding:const EdgeInsets.only(right: 16),
                    child: CustomBookImage(imageUrl: state.books[index].volumeInfo.imageLinks.thumbnail),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return  const CustomLoadingIndicator();
        }
      },
    );
  }
}
