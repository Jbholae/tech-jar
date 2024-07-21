import 'package:json_annotation/json_annotation.dart';
import 'package:tech_jar/model/post.dart';

part 'post_comment.g.dart';

@JsonSerializable()
class PostCommentModel extends PostModel {
  final String? name;
  final String? email;
  final int? postId;

  PostCommentModel({
    super.body,
    super.id,
    this.name,
    this.email,
    this.postId,
  });

  factory PostCommentModel.fromJson(Map<String, dynamic> json) =>
      _$PostCommentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PostCommentModelToJson(this);
}
