// lib/presentation/router/app_router.dart

import 'package:flutter/cupertino.dart';
import 'package:suppose_test_task/data/data_sources/local_data_source/session_storage.dart';
import 'package:suppose_test_task/injector.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/birthday/birthday_page.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/gender/gender_page.dart';
import 'package:suppose_test_task/presentation/pages/onBoarding/nick_name/nick_name_page.dart';
import 'package:suppose_test_task/presentation/pages/onboarding/onboarding_page.dart';
import 'package:suppose_test_task/presentation/pages/photo/photo.dart';
import 'package:suppose_test_task/presentation/pages/photo/photo_preview/photo_preview_page.dart';
import 'package:suppose_test_task/presentation/pages/photo/take_photo/take_photo_page.dart';
import 'package:suppose_test_task/presentation/pages/profile/profile_page.dart';
import 'package:suppose_test_task/presentation/router/route_path.dart';
import 'package:go_router/go_router.dart';

typedef TransitionBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> sAnimation,
  Widget child,
);

mixin AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigatorKey');
  static final localDataSource = getIt<LocalDataSource>();
  static final initialLocation = RoutePath.onBoarding;
  // localDataSource.isFirstLaunch ? RoutePath.onBoarding : RoutePath.photo;

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: initialLocation,
    navigatorKey: navigatorKey,
    routes: [
      // OnBoarding Routes
      GoRoute(
        name: RoutePath.onBoarding,
        path: RoutePath.onBoarding,
        builder: (context, state) => const OnboardingPage(),
        routes: [
          GoRoute(
            parentNavigatorKey: navigatorKey,
            name: RoutePath.birthday,
            path: RoutePath.getPageName(fullPath: RoutePath.birthday),

            // path: RoutePath.birthday,
            builder: (context, state) => const BirthdayPage(),
          ),
          GoRoute(
            parentNavigatorKey: navigatorKey,
            name: RoutePath.nickname,
            path: RoutePath.getPageName(fullPath: RoutePath.nickname),
            builder: (context, state) => const NicknamePage(),
          ),
          GoRoute(
            parentNavigatorKey: navigatorKey,
            name: RoutePath.gender,
            path: RoutePath.getPageName(fullPath: RoutePath.gender),
            builder: (context, state) => const GenderPage(),
          ),
        ],
      ),
      // Photo Routes
      GoRoute(
        name: RoutePath.photo,
        path: RoutePath.photo,
        builder: (context, state) => const PhotoPage(),
        routes: [
          GoRoute(
            parentNavigatorKey: navigatorKey,
            name: RoutePath.takePhoto,
            path: RoutePath.takePhoto,
            builder: (context, state) => const TakePhotoPage(),
          ),
          GoRoute(
            parentNavigatorKey: navigatorKey,
            name: RoutePath.photoPreview,
            path: RoutePath.photoPreview,
            pageBuilder: (context, state) => CupertinoPage(
              key: ValueKey(state.pageKey),
              child: const PhotoPreviewPage(),
            ),
          ),
        ],
      ),
      // Profile Route
      GoRoute(
        name: RoutePath.profile,
        path: RoutePath.profile,
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}
