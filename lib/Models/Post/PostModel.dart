import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.id,
    this.userId,
    this.content,
    this.images,
    this.likes
  });

  var id;
  var userId;
  var content;
  var images;
  var likes;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["_id"],
        userId: json["userId"],
        content: json["content"],
        images: json["images"],
        likes:json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "content": content,
        "images": images,
        "likes":likes
      };
}
