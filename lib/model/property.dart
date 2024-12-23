class Property {
  final String title;
  final String price;
  final String address;
  final String bedrooms;
  final String bathrooms;
  final String image;
  final String? distance;

  Property({
    required this.title,
    required this.price,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.image,
    this.distance,
  });
}