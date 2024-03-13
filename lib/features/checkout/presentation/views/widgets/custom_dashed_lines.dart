import 'package:flutter/material.dart';

class CustomDashedLines extends StatelessWidget {
  const CustomDashedLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          30,
          (index) => Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xffB8B8B8),
                  ),
                  height: 2,
                ),
              ))),
    );
  }
}
