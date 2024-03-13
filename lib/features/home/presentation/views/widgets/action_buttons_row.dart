import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_squad/core/utils/constants.dart';
import 'package:story_squad/core/utils/functions/build_error_snack_bar.dart';
import 'package:story_squad/core/utils/spaces.dart';
import 'package:story_squad/core/widgets/custom_button.dart';
import 'package:story_squad/features/home/presentation/manager/preview_price_cubit/preview_price_cubit.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({super.key, required this.price, required this.url});

  final double price;
  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreviewPriceCubit, PreviewPriceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpaces.kSpace8 + AppSpaces.kSpace30,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 48,
                  onPressed: () {},
                  text: price == 0.0 ? 'Free' : '$price\$',
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSpaces.kBorderRadius15),
                    bottomLeft: Radius.circular(AppSpaces.kBorderRadius15),
                  ),
                ),
              ),
              Expanded(
                child: CustomButton(
                  height: 48,
                  onPressed: () {
                    if (url.isNotEmpty) {
                      BlocProvider.of<PreviewPriceCubit>(context)
                          .previewBook(url: url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildErrorSnackBar('No preview for this book'),
                      );
                    }
                  },
                  text: 'Preview',
                  backgroundColor: AppConstants.kSecondaryColor,
                  textColor: Colors.white,
                  textSize: 16,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(AppSpaces.kBorderRadius15),
                    bottomRight: Radius.circular(AppSpaces.kBorderRadius15),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
