import 'dart:convert';

import 'package:apis_series/models/single_post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //withModel

  Future<SinglePostWithModel?> getSinglePostWithModel() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        SinglePostWithModel model =
            SinglePostWithModel.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
