class Item {
  final int id;
  final double price;
  final String name;
  final String? image;
  final String shopName;
  final String location;

  Item({
    required this.id,
    required this.name,
    required this.price,
    this.image = 'assets/images/coffee_beans.png',
    required this.shopName,
    required this.location,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['beans_id'], 
      name: json['product_name'], 
      price: (json['price'] as num).toDouble(), 
      image: json['image'] ?? 'assets/images/coffee_beans.png', 
      shopName: json['shop_name'], 
      location: json['location'],
    );
  }
}