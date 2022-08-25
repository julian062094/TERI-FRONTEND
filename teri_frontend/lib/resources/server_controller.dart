import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class ServerControllerAPI {

  final url = "http://127.0.0.1:8000/login/";

  Future login(String userName, String password) async {
    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": userName,
          "password": password
        })
    );
    if (response.statusCode == 200)
      {
        var json = response.body;
        return jsonDecode(json);
      } else{
      var json = response.body;
      return jsonDecode(json);
    }
  }
}