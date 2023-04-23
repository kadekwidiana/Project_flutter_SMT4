class Product {
  int? id;
  String name;
  String code;
  String category;
  String description;

  Product(
      {this.id,
      required this.name,
      required this.code,
      required this.category,
      required this.description});

  Product.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        code = res["code"],
        category = res["category"],
        description = res["description"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'category': category,
      'description': description
    };
  }
}
