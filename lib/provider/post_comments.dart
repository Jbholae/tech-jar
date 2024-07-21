import 'package:flutter/material.dart';
import 'package:tech_jar/config/api_services.dart';

class PostCommentsProvider with ChangeNotifier {
  bool loading = false;

  postComment(int postId, String comment) async {
    loading = true;
    await ApiServices().postComment(postId, comment);
    loading = false;
    notifyListeners();
  }

  /* Future<bool> postComment(int postId, String comment) async {
    loading = true;
    try {
      await ApiServices().postComment(postId, comment);
      loading = false;
      notifyListeners();
      return true; // Indicate success
    } catch (error) {
      loading = false;
      notifyListeners();
      return false; // Indicate failure
    }
  } */

}
