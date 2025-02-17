import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/book_model/book_model.dart';

abstract class HomeRepo {
  // بحدد ال feature هتعمل اي
  // for the home feature : you need to identify the feature in home screen
  Future<Either<Failures,List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failures,List<BookModel>>> fetchFeaturedBooks();
}
