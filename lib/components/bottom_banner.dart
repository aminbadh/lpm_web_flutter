import 'package:flutter/material.dart';

class BottomBanner extends StatelessWidget {
  const BottomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: double.infinity,
      child: Column(
        children: [
          const Divider(height: 1),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "© Lycée Pilote Monastir 2021",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.phone_outlined),
                    SizedBox(width: 12),
                    Text(
                      "+216 73 465 166",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.mail_outline),
                    SizedBox(width: 12),
                    Text(
                      "contact@lpm.school",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.place_outlined),
                    SizedBox(width: 12),
                    Text(
                      "Avenue Taieb M'hiri 5000 Monastir, Tunisia",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
