import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/core/utils/constants.dart';
import 'package:story_squad/core/utils/router.dart';

import '../../../../../core/utils/assets.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    // dispose the animation controller to prevent memory leaks
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAssets.kLogoImage),
        const SizedBox(
          height: 4,
        ),
        SlidingText(
          slidingAnimation: slidingAnimation,
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    // initialize the animationController object
    animationController = AnimationController(
      vsync: this,
      duration: AppConstants.kSlidingDuration,
    );
// initialize the slidingAnimation object with Tween animation
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement(
        AppRouter.kHomeView,
      );
    });
  }
}
