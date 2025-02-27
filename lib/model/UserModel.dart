
class UserModel {

  final String img;
  final String userName;


  UserModel({
    required this.img,
    required this.userName,

  });

  // Factory constructor to create a ProductModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      img: json['img'] ?? '',
      userName: json['userName'] ?? '',
    );
  }

  // Convert ProductModel to JSON map
  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'userName': userName,
    };
  }
}
