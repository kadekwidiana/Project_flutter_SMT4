class Product {
  int? id;
  String title;
  String image;
  String rating;
  String category;
  String description;

  Product(
      {this.id,
      required this.title,
      required this.image,
      required this.rating,
      required this.category,
      required this.description});

  Product.fromMap(Map<String, dynamic> res)
      : id = res["id"], 
        title = res["title"],
        image = res["image"],
        rating = res["rating"],
        category = res["category"],
        description = res["description"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title, 
      'image': image, 
      'rating': rating,
      'category': category,
      'description': description
    };
  }
}
