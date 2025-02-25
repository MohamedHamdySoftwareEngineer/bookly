import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_implementation.dart';
import 'features/home/presentation/manager/features/featured_books/presentation/cubit/featured_books_cubit.dart';
import 'features/home/presentation/manager/features/newest books/presentation/newest_books_cubit/newest_books_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // if this feature will be in this screen only , you should put it in this screen not here (putting here will include all application)
        BlocProvider<FeaturedBooksCubit>(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider<NewestBooksCubit>(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchNewestBooks(),
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
