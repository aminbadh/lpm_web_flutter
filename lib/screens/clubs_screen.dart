import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lpm_main/components/new_page.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({Key? key}) : super(key: key);

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
