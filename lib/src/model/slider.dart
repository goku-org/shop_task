class SliderImage {
  SliderImage({
    required this.id,
    required this.title,
    required this.text,
    required this.link,
    required this.image,
  });

  final int id;
  final String title;
  final dynamic text;
  final dynamic link;
  final String image;

  factory SliderImage.fromMap(Map<String, dynamic> json) => SliderImage(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        link: json["link"],
        image: json["image"],
      );
}
