import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class PostModel {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  PostModel({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
