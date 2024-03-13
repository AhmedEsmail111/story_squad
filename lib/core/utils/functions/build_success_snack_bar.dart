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
        Expanded(
          child: Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.green, // Customize the background color
    behavior: SnackBarBehavior.floating, // Make it float above other widgets
    duration: const Duration(seconds: 3), // Show for 3 seconds
  );
}
