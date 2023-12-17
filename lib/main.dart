import 'package:flutter/material.dart';
import 'package:htppapp/navigation_app.dart';
import 'package:htppapp/providers/cart_provider.dart';
import 'package:htppapp/providers/theme_providert.dart';
import 'package:htppapp/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const NavigationApp()));
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Navigation(),
    );
  }
}
