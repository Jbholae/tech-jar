import 'package:flutter/material.dart';
import 'package:tech_jar/config/api_services.dart';
import 'package:tech_jar/model/post.dart';

class GetPostDetailsProvider with ChangeNotifier {
  PostModel postDetailsResponse = PostModel();
  bool loading = false;

  getPostDetailsData(int postId) async {
    loading = true;
    postDetailsResponse = await ApiServices().getPostDetails(postId);
    loading = false;
    notifyListeners();
  }
}
