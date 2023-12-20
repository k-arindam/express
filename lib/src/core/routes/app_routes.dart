import 'package:express/src/views/chat/chat_screen.dart';
import 'package:express/src/views/home_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static const String home = '/';
  static const String chat = '/chat';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case chat:
        return MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text("${settings.name} not found!"),
              ),
            );
          },
        );
    }
  }
}
