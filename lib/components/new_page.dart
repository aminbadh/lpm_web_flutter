import 'package:flutter/material.dart';

import 'app_bar.dart';

class NewPage extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  const NewPage({Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          child,
          const MainAppBar(),
        ],
      ),
    );
  }
}
