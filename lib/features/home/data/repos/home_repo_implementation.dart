import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import 'home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  //fetch newest books
  @override
  Future<Either<Failures, List<BookModel>>> fetchBestSellerBooks() {
    apiService.get(endPoint: 'volumes?q=subject:programming&Sorting=newest&Filtering=free-ebooks');
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
