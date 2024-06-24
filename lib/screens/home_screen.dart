import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lpm_main/components/bottom_banner.dart';
import 'package:lpm_main/components/new_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Color _color;

  @override
  initState() {
    _color = _getRandomColor();
    super.initState();
  }

  Color _getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return NewPage(
      child: Column(
        children: [
          const SizedBox(height: 56),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return Scrollbar(
                child: ListView(
                  children: [
                    AnimatedContainer(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      color: _color,
                      duration: const Duration(milliseconds: 300),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[900]?.withOpacity(.15),
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.grey[50]?.withOpacity(.4),
                                size: 48,
                              ),
                            ),
                            bottom: 12,
                            left: 24,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[900]?.withOpacity(.3),
                              ),
                              margin: const EdgeInsets.only(right: 24),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.grey[200],
                                    size: 32,
                                  ),
                                ),
                                onTap: () =>
                                    setState(() => _color = _getRandomColor()),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[900]?.withOpacity(.4),
                              ),
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(left: 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lycée Pilote Monastir",
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      color: Colors.grey[50],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Welcome, This is the official website of the LPM High school.\nLPM, short for Lycée Pilote Monstir is a prestigious, innovative and elitist public\nhigh school in Monastir, Tunisia, which opened its doors since the 2004 school year.\nThe education system tends towards elitism, while teachers are also carefully selected\nby inspectors from the Ministry of National Education.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 0.5,
                                      color: Colors.grey[50],
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // color: _color.withOpacity(0.6),
                      height: constraints.maxHeight + 4,
                      child: Column(
                        children: [
                          SizedBox(height: 36),
                          Text(
                            "Notre Etablissement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 46),
                          Row(
                            children: [
                              SizedBox(width: constraints.maxWidth / 20),
                              SizedBox(
                                height: constraints.maxHeight / 2.8,
                                width: constraints.maxWidth / 3,
                                child: Placeholder(),
                              ),
                              SizedBox(width: 36),
                              Expanded(
                                  child: Container(
                                      height: constraints.maxHeight / 2.8,
                                      color: Colors.grey.shade300
                                          .withOpacity(0.3))),
                              SizedBox(width: constraints.maxWidth / 20),
                            ],
                          ),
                          SizedBox(height: 46),
                          Row(
                            children: [
                              SizedBox(width: constraints.maxWidth / 20),
                              Expanded(
                                  child: Container(
                                      height: constraints.maxHeight / 2.8,
                                      color: Colors.grey.shade300
                                          .withOpacity(0.3))),
                              SizedBox(width: 36),
                              SizedBox(
                                height: constraints.maxHeight / 2.8,
                                width: constraints.maxWidth / 3,
                                child: Placeholder(),
                              ),
                              SizedBox(width: constraints.maxWidth / 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // color: _color.withOpacity(0.3),
                      height: constraints.maxHeight + 4,
                      child: Column(
                        children: [
                          SizedBox(height: 36),
                          Text(
                            "Notre Etablissement",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 46),
                          Row(
                            children: [
                              SizedBox(width: constraints.maxWidth / 20),
                              SizedBox(
                                height: constraints.maxHeight / 2.8,
                                width: constraints.maxWidth / 3,
                                child: Placeholder(),
                              ),
                              SizedBox(width: 36),
                              Expanded(
                                  child: Container(
                                      height: constraints.maxHeight / 2.8,
                                      color: Colors.grey.shade300
                                          .withOpacity(0.3))),
                              SizedBox(width: constraints.maxWidth / 20),
                            ],
                          ),
                          SizedBox(height: 46),
                          Row(
                            children: [
                              SizedBox(width: constraints.maxWidth / 20),
                              Expanded(
                                  child: Container(
                                      height: constraints.maxHeight / 2.8,
                                      color: Colors.grey.shade300
                                          .withOpacity(0.3))),
                              SizedBox(width: 36),
                              SizedBox(
                                height: constraints.maxHeight / 2.8,
                                width: constraints.maxWidth / 3,
                                child: Placeholder(),
                              ),
                              SizedBox(width: constraints.maxWidth / 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const BottomBanner(),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
