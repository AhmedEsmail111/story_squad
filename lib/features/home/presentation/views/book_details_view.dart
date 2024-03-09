import 'package:flutter/material.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';

import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookEntity: bookEntity,
        ),
      ),
    );
  }
}
