import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
import 'login.dart';
import 'new_tweet.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final goRoute = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginWidget(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => TwitterPage(state.extra == null ? "" : state.extra as String),
        routes: [
          GoRoute(
            path: 'new',
            builder: (context, state) => const NewTweetPage(),
          )
        ]
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      key: state.pageKey,
      body: const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRoute,
      title: 'X Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
