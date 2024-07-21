import 'package:flutter/material.dart';
import 'package:tech_jar/config/api_services.dart';
import 'package:tech_jar/model/post_comment.dart';

class GetPostCommentsProvider with ChangeNotifier {
  List<PostCommentModel> postCommentResponse = [];
  bool loading = false;

  getPostCommentData(int postId) async {
    loading = true;
    postCommentResponse = await ApiServices().getPostDetailComment(postId);
    loading = false;
    notifyListeners();
  }
}
