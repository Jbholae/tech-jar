import 'package:dio/dio.dart';
import 'package:tech_jar/model/post.dart';
import 'package:tech_jar/model/post_comment.dart';

class ApiServices {
  final dio = Dio();
  String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<PostModel>> getPosts() async {
    List<PostModel> postData = <PostModel>[];
    Response response = await dio.get('$baseUrl/posts');
    try {
      if (response.statusCode == 200) {
        var data = response.data;
        postData = data.map<PostModel>((e) => PostModel.fromJson(e)).toList();
        return postData;
      }
    } catch (e) {
      Exception(e);
    }
    return postData;
  }

  Future<PostModel> getPostDetails(int postId) async {
    PostModel postDetailData = PostModel();
    Response response = await dio.get('$baseUrl/posts/$postId');
    try {
      if (response.statusCode == 200) {
        var data = response.data;
        postDetailData = PostModel.fromJson(data);
        return postDetailData;
      }
    } catch (e) {
      Exception(e);
    }
    return postDetailData;
  }

  Future<List<PostCommentModel>> getPostDetailComment(int postId) async {
    List<PostCommentModel> postDetailCommentData = [];
    Response response = await dio.get('$baseUrl/posts/$postId/comments');
    try {
      if (response.statusCode == 200) {
        var data = response.data;
        postDetailCommentData = (data)
            .map<PostCommentModel>((e) => PostCommentModel.fromJson(e))
            .toList();
        return postDetailCommentData;
      }
    } catch (e) {
      Exception(e);
    }
    return postDetailCommentData;
  }

  Future postComment(int postId, String comment) async {
    Response response =
        await dio.post('$baseUrl/posts/$postId/comments', data: {
      'body': comment,
      'userId': 1,
    });
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      Exception(e);
      return false;
    }
  }
}
