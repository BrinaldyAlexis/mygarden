import 'package:flutter/material.dart';


class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.size,
    required this.name,
    required this.image,
  });

  final Size size;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.225,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(image, height: 40, fit: BoxFit.fitWidth)
            ),
            Text(name, style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}