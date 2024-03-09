import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_squad/features/search/presentation/manager/search_cubit/search_cubit.dart';

import '../../../../../core/utils/spaces.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextField(
        focusNode: _focusNode,
        onChanged: (value) {
          if (value.trim().isNotEmpty) {
            BlocProvider.of<SearchCubit>(context).changeQueryText(value.trim());
          }
        },
        // onSubmitted: (value) {
        //   if (value.trim().isNotEmpty) {
        //     BlocProvider.of<SearchCubit>(context).fetchFilteredBooks(
        //       query: value.trim(),
        //     );
        //   }
        // },
        decoration: InputDecoration(
          enabledBorder: buildOutlineBorder(),
          focusedBorder: buildOutlineBorder(),
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: () {
              _focusNode.unfocus();
              if (BlocProvider.of<SearchCubit>(context)
                  .query
                  .trim()
                  .isNotEmpty) {
                BlocProvider.of<SearchCubit>(context).fetchFilteredBooks(
                  query: BlocProvider.of<SearchCubit>(context).query.trim(),
                );
              }
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpaces.kBorderRadius15),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
