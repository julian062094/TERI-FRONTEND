import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class ServerControllerAPI {

  var urlLogin = "https://teri-erp.herokuapp.com/login/";
  var urlNegocios = "https://teri-erp.herokuapp.com/api/negocios";

  Future login(String userName, String password) async {
    var response = await http.post(Uri.parse(urlLogin), body:
        {
          "username" : userName,
          "password" : password
        }
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    } else{
      var json = response.body;
      return jsonDecode(json);
    }
  }

  Future projects() async {
    var response = await http.get(Uri.parse(urlNegocios));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json["negocios"];
    } else{
      print("Error");
    }
  }

}