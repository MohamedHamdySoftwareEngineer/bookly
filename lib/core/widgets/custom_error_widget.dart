// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage,style: Styles.textStyle18);
  }
}
