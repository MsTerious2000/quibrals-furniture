class Product {
  String image;
  String name;
  String description;
  String price;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  static Product fromJson(json) {
    return Product(
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}

String imagePath = 'assets/images/products';

final List<Map<String, dynamic>> product_list = [
  {
    "image": "$imagePath/0001.jpg",
    "name": "SLUTCH SALA SET",
    "description": "with side table",
    "price": "P 1.00",
  },
  {
    "image": "$imagePath/0002.jpg",
    "name": "SLUTCH SALA SET",
    "description": "without side table",
    "price": "P 1.00",
  },
  {
    "image": "$imagePath/0003.jpg",
    "name": "ANCHOR DESIGN SALA SET",
    "description": "",
    "price": "P 1.00",
  },
  {
    "image": "$imagePath/0004.jpg",
    "name": "DOUBLE DOOR WITH DOOR JAMB",
    "description": "Pwede walang hamba, not the same price",
    "price": "P 1.00",
  },
  {
    "image": "$imagePath/0005.jpg",
    "name": "WOOD DRESSER",
    "description": "",
    "price": "P 1.00",
  },
  {
    "image": "$imagePath/0006.jpg",
    "name": "DOUBLE DOOR WITH DOOR JAMB",
    "description": "",
    "price": "P 1.00",
  },
];
