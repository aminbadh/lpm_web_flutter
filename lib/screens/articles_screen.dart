import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lpm_main/components/new_page.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewPage(
      child: Container(
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(1.0),
      ),
    );
  }
}
