import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: AppStyles.textStyle18,
        ),
      ),
      body: const MyCartViewBody(),
    );
  }
}
