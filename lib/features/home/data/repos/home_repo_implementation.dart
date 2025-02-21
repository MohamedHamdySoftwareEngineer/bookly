import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:programming&Sorting=newest&Filtering=free-ebooks');
      // the data that will return in List format
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromBookJson(item));
      }

      return right(books);
    } catch (e) {
      // DioError have the status code(anyone except 200) and the respose (the api result)
      if (e is DioError) {
        return left(ServerFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
