import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    backgroundColor: Colors.red, // Customize the background color
    behavior: SnackBarBehavior.floating, // Make it float above other widgets
    duration: const Duration(seconds: 3), // Show for 3 seconds
  );
}
