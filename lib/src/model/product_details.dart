class ProductDetails {
  ProductDetails({
    required this.id,
    required this.merchant,
    required this.payed,
    required this.favorite,
    required this.title,
    required this.qty,
    required this.price,
    required this.oldPrice,
    required this.cat,
    required this.details,
    required this.images,
    required this.brandsModal,
    required this.years,
    required this.countryManufacture,
  });

  final int id;
  final int merchant;
  final int payed;
  final bool favorite;
  final String title;
  final int qty;
  final int price;
  final int oldPrice;
  final String cat;
  final String details;
  final List<Img> images;
  final List<BrandsModal> brandsModal;
  final List<Year> years;
  final String countryManufacture;

  factory ProductDetails.fromMap(Map<String, dynamic> json) => ProductDetails(
        id: json["id"],
        merchant: json["merchant"],
        payed: json["payed"],
        favorite: json["favorite"],
        title: json["title"],
        qty: json["qty"] ?? 1,
        price: json["price"],
        oldPrice: json["old_price"],
        cat: json["cat"],
        details: json["details"],
        images: List<Img>.from(json["imgs"].map((x) => Img.fromMap(x))),
        brandsModal: List<BrandsModal>.from(
            json["brands_modal"].map((x) => BrandsModal.fromMap(x))),
        years: List<Year>.from(json["years"].map((x) => Year.fromMap(x))),
        countryManufacture: json["country_manufacture"],
      );
}

class BrandsModal {
  BrandsModal({
    required this.brand,
    required this.modal,
  });

  final String brand;
  final String modal;

  factory BrandsModal.fromMap(Map<String, dynamic> json) => BrandsModal(
        brand: json["brnad"] ?? '',
        modal: json["modal"] ?? '',
      );
}

class Img {
  Img({
    required this.imgId,
    required this.image,
  });

  final int imgId;
  final String image;

  factory Img.fromMap(Map<String, dynamic> json) => Img(
        imgId: json["img_id"] ?? '',
        image: json["image"] ?? '',
      );
}

class Year {
  Year({
    required this.id,
    required this.year,
  });

  final int id;
  final int year;

  factory Year.fromMap(Map<String, dynamic> json) => Year(
        id: json["id"] ?? '',
        year: json["year"] ?? '',
      );
}
