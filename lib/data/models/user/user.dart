import 'package:spotify_clone/domain/entities/user/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageURL;

  UserModel({this.fullName, this.email, this.imageURL});

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data["name"];
    email = data["email"];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName ?? "",
      email: email ?? "",
      imageURL: imageURL ?? "",
    );
  }
}
