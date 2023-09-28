import 'package:flutter/material.dart';
import 'package:mygarden/constants.dart';
import 'package:mygarden/models/product.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo-2.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: (){},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(margin: const EdgeInsets.only(left: 20), child: const Text('Shopping Cart', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600))),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: featuredProducts.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder:(context, index) {
                final Product product = featuredProducts[index];
                return ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: Image.asset(product.images[0])
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.black,),
                          onPressed: () {},
                        ),
                      const Text('1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: Colors.black,),
                        onPressed: () {},
                    ),
                  ],
                ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text('Enter Promo Code', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Promo Code',
                suffixIcon: const Icon(Icons.sell_outlined, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                fillColor: Colors.white
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('\$109.97', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('\$10.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('\$119.97', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: size.height * 0.06,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants().primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: const Text('Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ),
          ),
          const SizedBox(height: 40),
        ],
        
      ),
    );
  }
}