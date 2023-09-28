import 'package:flutter/material.dart';
import 'package:mygarden/models/plants.dart';
import 'package:mygarden/widgets/card_product.dart';

class GridProducts extends StatelessWidget {
  const GridProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),

      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: featuredProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15
        ),
        itemBuilder: (context, index) {
          final Plant plant = featuredProducts[index];
          return CardProduct(plant: plant);
        },
      ),
    );
  }
}
