import 'package:flutter/material.dart';
import 'package:tech_jar/config/api_services.dart';

class PostCommentsProvider with ChangeNotifier {
  bool loading = false;

  Future<void> postComment(
    int postId,
    String comment,
    Function onSuccess,
  ) async {
    loading = true;
    try {
      await ApiServices().postComment(postId, comment);
      loading = false;
      onSuccess(); // Call the callback function upon success
    } catch (e) {
      loading = false;
    }
    loading = false;
    notifyListeners();
  }
}
