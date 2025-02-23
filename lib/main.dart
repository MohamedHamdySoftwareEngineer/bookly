import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_bloc/src/multi_bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'core/utils/api_service.dart';
import 'core/utils/app_router.dart';
import 'features/home/data/repos/home_repo.dart';
import 'features/home/data/repos/home_repo_implementation.dart';
import 'features/home/presentation/manger/features/featured_books/presentation/cubit/featured_books_cubit.dart';
import 'features/home/presentation/manger/features/newest books/presentation/newest_books_cubit/newest_books_cubit.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
          create: (context) => FeaturedBooksCubit(
            HomeRepoImplementation(
              ApiService(
                dio: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider<NewestBooksCubit>(
          create: (context) => NewestBooksCubit(
            HomeRepoImplementation(
              ApiService(
                dio: Dio(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ), // background color for all screens in the app
      ),
    );
  }
}
