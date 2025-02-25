// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../data/models/book_model/book_model.dart';
import '../../../../../../data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(
    this.homeRepo,
  ) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());

    // result returns either failure or list of book model , then we can use fold method in result to control that who will returns
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (failures) {
        emit(NewestBooksFailure(failures.errorMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      }
    );
  }
}
