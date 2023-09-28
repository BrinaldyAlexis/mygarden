
class Product {

  final String name;
  final String description;
  final List<String> images;
  final double price;

  Product(
    {
      required this.name,
      required this.description,
      required this.images,
      required this.price
    }
  );

}

  List<Product> featuredProducts = [
    Product(
      name: 'Agave',
      description: 'Natural Plant', 
      images: [
        'assets/images/agave-1.png',
        'assets/images/agave-2.png',
        'assets/images/agave-3.png',
      ],
      price: 20.00
    ),
    Product(
      name: 'Dieffenbachia',
      description: 'Artificial Plant', 
      images: [
        'assets/images/dieffenbachia-1.png',
        'assets/images/dieffenbachia-2.png',
        'assets/images/dieffenbachia-3.png',
      ],
      price: 29.99
    ),
    Product(
      name: 'Philodendron',
      description: 'Artificial Plant', 
      images: [
        'assets/images/philodendron-1.png',
        'assets/images/philodendron-2.png',
        'assets/images/philodendron-3.png',
      ],
      price: 24.99
    ),
    Product(
      name: 'Sansevieria',
      description: 'Natural Plant', 
      images: [
        'assets/images/sansevieria-1.png',
        'assets/images/sansevieria-2.png',
        'assets/images/sansevieria-3.png',
      ],
      price: 35.99
    ),
  ];



