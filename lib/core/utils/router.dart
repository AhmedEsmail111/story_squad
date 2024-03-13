import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/checkout/presentation/views/my_cart_view.dart';
import '../../features/checkout/presentation/views/thank_you_view.dart';
import '../../features/home/domain/entities/book_entity.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/category_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kCategoryView = '/categoryView';
  static const kCheckoutView = '/checkoutView';
  static const kThankYouView = '/thankYouView';

  static const kAnimationDuration = Duration(milliseconds: 700);
  static const kSlidAnimationDuration = Duration(milliseconds: 250);
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (ctx, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          transitionDuration: kAnimationDuration,
          reverseTransitionDuration: kAnimationDuration,
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: kBookDetailsView,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: kSlidAnimationDuration,
          reverseTransitionDuration: kSlidAnimationDuration,
          child: BookDetailsView(
            bookEntity: state.extra as BookEntity,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: kSlidAnimationDuration,
          reverseTransitionDuration: kSlidAnimationDuration,
          child: const SearchView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: kCategoryView,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: kSlidAnimationDuration,
          reverseTransitionDuration: kSlidAnimationDuration,
          child: CategoryView(
            category: state.extra as String,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: kCheckoutView,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: kSlidAnimationDuration,
          reverseTransitionDuration: kSlidAnimationDuration,
          child: const MyCartView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: kThankYouView,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: kSlidAnimationDuration,
          reverseTransitionDuration: kSlidAnimationDuration,
          child: ThankYouView(
            extra: state.extra as Map<String, dynamic>,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
    ],
  );
}
