import 'package:flutter/material.dart';
import 'package:lpm_main/screens/not_found_screen.dart';

import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'screens/articles_screen.dart';
import 'screens/clubs_screen.dart';
import 'screens/home_screen.dart';

void main() {
  configureApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LPM - Lycée Pilote Mohammed Fredj Chedhly Monastir",
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        print(settings.name);
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
              settings: settings,
            );
          case '/articles':
            return MaterialPageRoute(
              builder: (context) => const ArticlesScreen(),
              settings: settings,
            );
          case '/clubs':
            return MaterialPageRoute(
              builder: (context) => const ClubsScreen(),
              settings: settings,
            );
          case '/search':
            return MaterialPageRoute(
              builder: (context) => const ClubsScreen(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const NotFoundScreen(),
              settings: settings,
            );
        }
      },
    ),
  );
}
