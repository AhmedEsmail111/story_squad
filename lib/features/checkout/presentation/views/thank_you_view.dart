import 'package:flutter/material.dart';

import 'widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, required this.extra});
  final Map<String, dynamic> extra;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThankYouViewBody(
        transactionData: extra,
      ),
    );
  }
}
