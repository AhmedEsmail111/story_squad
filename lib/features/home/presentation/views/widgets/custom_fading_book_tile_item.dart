import 'package:flutter/material.dart';
import 'package:story_squad/core/utils/constants.dart';

import '../../../../../core/utils/spaces.dart';

class CustomFadingBookTileItem extends StatelessWidget {
  const CustomFadingBookTileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                AppSpaces.kBorderRadius8,
              ),
              child: Container(
                color: AppConstants.kFadingColor,
              ),
            ),
          ),
          const SizedBox(
            width: AppSpaces.kSpace30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSpaces.kBorderRadius8,
                      ),
                      color: AppConstants.kFadingColor,
                    ),
                    height: 45,
                  ),
                ),
                const SizedBox(
                  height: AppSpaces.kSpace8,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSpaces.kBorderRadius8,
                      ),
                      color: AppConstants.kFadingColor,
                    ),
                    height: 30,
                  ),
                ),
                const SizedBox(
                  height: AppSpaces.kSpace8,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppSpaces.kBorderRadius8,
                        ),
                        color: AppConstants.kFadingColor,
                      ),
                      height: 25,
                      width: 65,
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppSpaces.kBorderRadius8,
                        ),
                        color: AppConstants.kFadingColor,
                      ),
                      height: 25,
                      width: 100,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
