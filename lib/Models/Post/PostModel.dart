import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.userId,
    this.content,
    this.images,
  });

  var userId;
  var content;
  var images;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        content: json["content"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "content": content,
        "images": images,
      };
}
