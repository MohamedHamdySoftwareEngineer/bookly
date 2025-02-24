
// import 'package:bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../../../../data/models/book_model/book_model.dart';
import '../../../../../../data/repos/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(
    this.homeRepo,
  ) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    // result returns either failure or list of book model , then we can use fold method in result to control that who will returns
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (failures) {
        emit(FeaturedBooksFailure(failures.errorMessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      }
    );
  }
}
