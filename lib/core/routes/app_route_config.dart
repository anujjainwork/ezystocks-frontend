import 'package:ezystocks/core/routes/app_route_constants.dart';
import 'package:ezystocks/features/splash_screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ezystocks/features/home/presentation/pages/home.dart';
import 'package:ezystocks/features/error_page/error_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash_screen',
    routes: [
      GoRoute(
        path: '/splash_screen',
        pageBuilder: (context,state){
          return MaterialPage(child: SplashScreen());
        }
      ),
      GoRoute(
        name: MyAppRouteConstants.homeRouteName,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.walletRouteName,
        path: '/wallet',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePage());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
  );
}

