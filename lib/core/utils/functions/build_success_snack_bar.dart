import 'package:flutter/material.dart';

SnackBar buildSuccessSnackBar(String message) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    backgroundColor: Colors.greenAccent, // Customize the background color
    behavior: SnackBarBehavior.floating, // Make it float above other widgets
    duration: const Duration(seconds: 3), // Show for 3 seconds
  );
}
