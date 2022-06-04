class CartProduct {
  int id;
  String title;
  String price;
  String image;
  int quantity;

  CartProduct(
      {required this.id,
      required this.title,
      required this.price,
        required this.image,
      required this.quantity});

  factory CartProduct.fromMap(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}
