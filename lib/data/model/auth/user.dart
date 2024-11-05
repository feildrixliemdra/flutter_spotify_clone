import 'package:flutter_spotify_clone/domain/entity/auth/user.dart';

class User {
  String? fullName;
  String? email;
  String? imageURL;

  User({this.fullName, this.email, this.imageURL});

  User.fromJson(Map<String, dynamic> data) {
    fullName = data['name'];
    email = data['email'];
  }
}

extension UserX on User {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      fullName: fullName,
      profileImage: imageURL,
    );
  }
}
