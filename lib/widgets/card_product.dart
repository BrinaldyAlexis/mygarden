import 'package:flutter/material.dart';
import 'package:mygarden/constants.dart';
import 'package:mygarden/models/product.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(product.images[0], height: 100, fit: BoxFit.fitWidth)),
            const SizedBox(height: 10),
            Text(product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Text(product.description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('\$${product.price}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Constants().primaryColor)),
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Constants().primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Constants().primaryColor.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.favorite, color: Colors.white, size: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}