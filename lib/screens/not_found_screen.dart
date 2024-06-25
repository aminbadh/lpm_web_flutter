import 'package:flutter/material.dart';

import '../components/bottom_banner.dart';
import '../components/new_page.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewPage(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "404",
                    style: TextStyle(
                        fontSize: 96,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.indigo[700]),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    "Page Not Found",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.indigo[600]),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Make sure you used the right URL",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      color: Colors.indigo,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const BottomBanner(),
        ],
      ),
    );
  }
}
