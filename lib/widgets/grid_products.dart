import 'package:flutter/material.dart';
import 'package:mygarden/models/product.dart';
import 'package:mygarden/screens/product_screen.dart';
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
          childAspectRatio: 0.75,
          crossAxisSpacing: 15, 
          mainAxisSpacing: 15
        ),
        itemBuilder: (context, index) {
          final Product product = featuredProducts[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product))),
            child: CardProduct(product: product),
          );
        },
      ),
    );
  }
}
