import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hayaku_app/screen/add_link/add_link.dart';
import 'package:hayaku_app/screen/auth/login.dart';

import '../screen/active_hayaku/nfc_active_hayaku.dart';
import '../screen/auth/account create/add_profile_pic.dart';
import '../screen/auth/account create/company_details.dart';
import '../screen/auth/account create/have_hayaku.dart';
import '../screen/auth/account create/qrhayaku.dart';
import '../screen/auth/forget_password.dart';
import '../screen/auth/register.dart';
import '../screen/onboring/welcome.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          //return const AddLinkScreen();
          return const AddLinkScreen();
        },
      ),
      GoRoute(
          path: '/login',
          name: 'login',
          builder: ((BuildContext context, GoRouterState state) {
            return const LoginScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/register',
          name: 'register',
          builder: ((BuildContext context, GoRouterState state) {
            return const RegisterScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/forgetPassword',
          name: 'forgetPassword',
          builder: ((BuildContext context, GoRouterState state) {
            return const ForgetPasswordScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/welcome',
          name: 'welcome',
          builder: ((BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/SetUsernameScreen',
          name: 'SetUsernameScreen',
          builder: ((BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/companyDetails',
          name: 'companyDetails',
          builder: ((BuildContext context, GoRouterState state) {
            return const CompneyDetailsScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/addProfilePicScreen',
          name: 'addProfilePicScreen',
          builder: ((BuildContext context, GoRouterState state) {
            return const AddProfilePicScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/haveHayakuScreen',
          name: 'haveHayakuScreen',
          builder: ((BuildContext context, GoRouterState state) {
            return const HaveHayakuScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/qrHayakuScreen',
          name: 'qrHayakuScreen',
          builder: ((BuildContext context, GoRouterState state) {
            return const QrHayakuScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/nfcActiveHayakuScreen',
          name: 'nfcActiveHayakuScreen',
          builder: ((BuildContext context, GoRouterState state) {
            return const NfcActiveHayakuScreen();
            //change this en home later
          })),
      GoRoute(
          path: '/addLink',
          name: 'addLink',
          builder: ((BuildContext context, GoRouterState state) {
            return const AddLinkScreen();
            //change this en home later
          })),
    ],
  );
}
