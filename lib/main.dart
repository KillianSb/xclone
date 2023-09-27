import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xclone/login.dart';
import 'package:xclone/home.dart';


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
        path: '/home/:email',
        builder: (context, state) => TwitterPage(
            state.pathParameters["email"] ?? ""
        ),
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
