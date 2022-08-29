import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class ServerControllerAPI {

  var url = "https://teri-erp.herokuapp.com/login/";

  Future login(String userName, String password) async {
    print("holo");
    var response = await http.post(Uri.parse(url), body:
        {
          "username" : userName,
          "password" : password
        }
    );
    print("hole");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    } else{
      var json = response.body;
      return jsonDecode(json);
    }
  }
}