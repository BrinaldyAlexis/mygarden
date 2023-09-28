
class Plant {

  final String name;
  final String description;
  final List<String> images;
  final double price;

  Plant(
    {
      required this.name,
      required this.description,
      required this.images,
      required this.price
    }
  );

}

  List<Plant> featuredProducts = [
    Plant(
      name: 'Agave',
      description: 'Natural Plant', 
      images: [
        'assets/images/agave-1.png',
        'assets/images/agave-2.png',
        'assets/images/agave-3.png',
      ],
      price: 20.00
    ),
    Plant(
      name: 'Dieffenbachia',
      description: 'Artificial Plant', 
      images: [
        'assets/images/dieffenbachia-1.png',
        'assets/images/dieffenbachia-2.png',
        'assets/images/dieffenbachia-3.png',
      ],
      price: 29.99
    ),
    Plant(
      name: 'Philodendron',
      description: 'Artificial Plant', 
      images: [
        'assets/images/philodendron-1.png',
        'assets/images/philodendron-2.png',
        'assets/images/philodendron-3.png',
      ],
      price: 24.99
    ),
    Plant(
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



