
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15,top: 15, bottom: 15),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {GoRouter.of(context).push(AppRouter.kSearchView);},
              icon: const Icon(
                Icons.search,
                size: 32,
              )),
        ],
      ),
    );
  }
}
