import 'package:flutter/material.dart';
import 'package:mygarden/constants.dart';
import 'package:mygarden/models/product.dart';


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
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: (){},
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
          Container(
            margin: const EdgeInsets.only(bottom: 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildIndicator(),
          ),

          
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