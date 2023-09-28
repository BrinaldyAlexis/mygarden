import 'package:flutter/material.dart';
import 'package:mygarden/constants.dart';
import 'package:mygarden/models/category.dart';
import 'package:mygarden/screens/cart_screen.dart';
import 'package:mygarden/widgets/grid_products.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int selectedCategoryIndex = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: (){},
        ),
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
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                fillColor: Colors.white
              ),
            ),
          ),
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final Category category = categoryList[index];
                bool isSelected = index == selectedCategoryIndex;
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 30,),
                  decoration: BoxDecoration(
                    color: isSelected ? Constants().primaryColor : Colors.white,
                    borderRadius:  const BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text(category.name, style: TextStyle(color: isSelected ? Colors.white : Constants().primaryColor, fontSize: 18, fontWeight: FontWeight.w600))
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Container(margin: const EdgeInsets.only(left: 20), child: const Text('Featured Products', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          const SizedBox(height: 10),
          const GridProducts(),
          const SizedBox(height: 10),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.8,

            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Constants().primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(15))
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('GET', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(width: 10),
                Text('15%', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(width: 10),
                Text('OFF TODAY', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}


