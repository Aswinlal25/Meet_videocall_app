class UserModel {
  String id;
  String? image;
  String? about;
  String email;
  String username;

  UserModel({
    required this.id,
    this.image,
    this.about,
    required this.email,
    required this.username,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      image: json['image'],
      about: json['about'],
      email: json['email'],
      username: json['username'],
    );
  }
}
