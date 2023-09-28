import 'package:flutter/material.dart';
import 'package:mygarden/constants.dart';
import 'package:mygarden/models/product.dart';
import 'package:mygarden/screens/cart_screen.dart';
import 'package:mygarden/widgets/feature_card.dart';
import 'package:badges/badges.dart' as badges;

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, super.key});
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PageController controller = PageController();
  int currentImage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentImage = controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo-2.png'),
        actions: [
           Stack(
            children: [
              IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())),
                icon: const Icon(Icons.shopping_cart),
              ),
              const Positioned(
                top: 0,
                right: 5,
                child: badges.Badge(
                  badgeContent: Text('4', style: TextStyle(color: Colors.white)),
                )
              )
            ],
          ),
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: (){},
          ),
        ],
      ),
      body: Column(
        children: [
          
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 30),
                height: size.height * 0.3,
                child: PageView.builder(
                  itemCount: widget.product.images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                  itemBuilder: (context, index) => Image.asset(widget.product.images[index]),
                ),
              ),
              Positioned(
                top: 10,
                right: 30,
                child: Container(
                  padding: const EdgeInsets.all(10),
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
                  child: const Icon(Icons.favorite, color: Colors.white),
                )
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildIndicator(),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeatureCard(size: size, name: 'Plant', image: 'assets/images/flower-pot.png'),
                  FeatureCard(size: size, name: 'Pot', image: 'assets/images/pot.png'),
                  FeatureCard(size: size, name: 'Light', image: 'assets/images/sun.png'),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.25,
            width: size.width,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFFFC166)),
                        Icon(Icons.star, color: Color(0xFFFFC166)),
                        Icon(Icons.star, color: Color(0xFFFFC166)),
                        Icon(Icons.star, color: Color(0xFFFFC166)),
                        Icon(Icons.star_half, color: Color(0xFFFFC166)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(widget.product.description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${widget.product.price}', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Constants().primaryColor)),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants().primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15)
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.shopping_cart, color: Colors.white),
                          SizedBox(width: 5),
                          Text('Add to cart', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
  
  List<Widget> buildIndicator() {
    List<Widget> indicators = [];
    for (int index = 0; index < widget.product.images.length; index++) {
      indicators.add(
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: currentImage == index ? Constants().primaryColor : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)
          ),
        )
      );
    }
    return indicators;
  }
}

