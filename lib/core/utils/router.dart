import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_squad/features/home/domain/entities/book_entity.dart';
import 'package:story_squad/features/home/presentation/views/book_details_view.dart';
import 'package:story_squad/features/home/presentation/views/category_view.dart';
import 'package:story_squad/features/home/presentation/views/home_view.dart';
import 'package:story_squad/features/search/presentation/views/search_view.dart';
import 'package:story_squad/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kCategoryView = '/categoryView';
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
          child: const CategoryView(),
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
