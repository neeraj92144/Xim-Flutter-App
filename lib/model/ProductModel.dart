class ProductModel {
  final String img;
  final String prodTitle;
  final String prodDesc;
  final String prodDesc2;
  final String prodCat1;
  final String prodCat2;
  final double rating;
  final int noOfRating;

  ProductModel({
    required this.img,
    required this.prodTitle,
    required this.prodDesc,
    required this.prodDesc2,
    required this.prodCat1,
    required this.prodCat2,
    required this.rating,
    required this.noOfRating,
  });

  // Factory constructor to create a ProductModel from a JSON map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      img: json['img'] ?? '',
      prodTitle: json['prodTitle'] ?? '',
      prodDesc: json['prodDesc'] ?? '',
      prodDesc2: json['prodDesc2'] ?? '',
      prodCat1: json['prodCat1'] ?? '',
      prodCat2: json['prodCat2'] ?? '',
      rating: json['rating'] ?? '',
      noOfRating: json['noOfRating'] ?? '',
    );
  }

  // Convert ProductModel to JSON map
  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'prodTitle': prodTitle,
      'prodDesc': prodDesc,
      'prodDesc2': prodDesc2,
      'prodCat1': prodCat1,
      'prodCat2': prodCat2,
      'rating': rating,
      'noOfRating': noOfRating,
    };
  }
}
