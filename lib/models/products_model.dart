class ProductsModel {
  String title;
  dynamic price;
  String description;
  String category;
  String image;

  ProductsModel({
    required this.title,
    this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image']);
}

List<ProductsModel> productModelFromJson(List list) =>
    List<ProductsModel>.from(
        list.map((item) => ProductsModel.fromJson(item)));
