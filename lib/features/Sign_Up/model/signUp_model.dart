class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uId;
  String? image;
  String? cover;

  String? bio;

  bool? isEmailVerified;
  UserModel({
    this.name,
    this.phone,
    this.bio,
    this.email,
    this.uId,
    this.isEmailVerified,
    this.image,
    this.cover,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    bio = json["bio"];

    phone = json["phone"];
    name = json["name"];
    uId = json["uId"];
    isEmailVerified = json["isEmailVerified"];
    image = json["image"];
    cover = json["cover"];
  }
  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "phone": phone,
      "name": name,
      "uId": uId,
      "bio": bio,
      "isEmailVerified": isEmailVerified,
      "image": image,
      "cover": cover
    };
  }
}
