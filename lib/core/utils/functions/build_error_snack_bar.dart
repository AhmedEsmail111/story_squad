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
        Expanded(
          child: Text(
            errorMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
    backgroundColor: const Color.fromARGB(
        255, 238, 81, 70), // Customize the background color
    behavior: SnackBarBehavior.floating, // Make it float above other widgets
    duration: const Duration(seconds: 3), // Show for 3 seconds
  );
}
