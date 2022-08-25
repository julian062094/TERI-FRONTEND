import 'dart:convert';

class UserToken {
  String token;

  UserToken(this.token);

  UserToken.fromJson(Map<String, dynamic> json)
      : token = json['key'];

  Map<String, dynamic> toJson() => {
    'key': token,
  };
}