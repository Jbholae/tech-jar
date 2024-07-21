import 'package:flutter/material.dart';
import 'package:tech_jar/config/api_services.dart';
import 'package:tech_jar/model/post.dart';

class GetPostProvider with ChangeNotifier {
  List<PostModel> getpostResponse = [];
  bool loading = false;

  getPostData() async {
    loading = true;
    getpostResponse = await ApiServices().getPosts();
    loading = false;
    notifyListeners();
  }
}
