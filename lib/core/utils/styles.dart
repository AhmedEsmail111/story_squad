import 'package:flutter/material.dart';

import 'constants.dart';

abstract class AppStyles {
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
    fontFamily: AppConstants.kGtSectraFine,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const textStyle24 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    height: 0,
  );
}
