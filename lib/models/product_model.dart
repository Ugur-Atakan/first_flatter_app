class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Map? rating;

  Product(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);

  Product.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    price = json['price']?.toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'];
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
