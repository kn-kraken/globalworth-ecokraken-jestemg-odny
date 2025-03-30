class Restaurant {
  final String id;
  final String name;
  final bool isInGlobalworth;
  final String address;
  final String? menu; // URL do menu
  final double rating;

  Restaurant({
    required this.id,
    required this.name,
    required this.isInGlobalworth,
    required this.address,
    this.menu,
    this.rating = 0,
  });
}
