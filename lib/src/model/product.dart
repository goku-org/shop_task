class Product {
  Product({
    required this.id,
    required this.merchant,
    required this.payed,
    required this.title,
    required this.price,
    required this.favorite,
    required this.image,
  });

  final int id;
  final int merchant;
  final int payed;
  final String title;
  final int price;
  final bool favorite;
  final String image;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    merchant: json["merchant"],
    payed: json["payed"],
    title: json["title"],
    price: json["price"],
    favorite: json["favorite"],
    image: json["image"],
  );
}
