// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int? id;
  String? nameProduct;
  String? imgProduct;
  int? priceProduct;
  String? descriptionProduct;
  String? category;
  bool? favoriteProduct;
  Product({
    this.id,
    this.nameProduct,
    this.imgProduct,
    this.priceProduct,
    this.descriptionProduct,
    this.category,
    this.favoriteProduct,
  });

  Product copyWith({
    int? id,
    String? nameProduct,
    String? imgProduct,
    int? priceProduct,
    String? descriptionProduct,
    String? category,
    bool? favoriteProduct,
  }) {
    return Product(
      id: id ?? this.id,
      nameProduct: nameProduct ?? this.nameProduct,
      imgProduct: imgProduct ?? this.imgProduct,
      priceProduct: priceProduct ?? this.priceProduct,
      descriptionProduct: descriptionProduct ?? this.descriptionProduct,
      category: category ?? this.category,
      favoriteProduct: favoriteProduct ?? this.favoriteProduct,
    );
  }
}
