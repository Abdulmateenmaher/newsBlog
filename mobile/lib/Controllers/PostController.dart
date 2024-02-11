

import 'dart:convert';

PostController postFromJson(String str) => PostController.fromJson(json.decode(str));

String postToJson(PostController data) => json.encode(data.toJson());

class PostController {
  Post post;
  int allLikes;
  List<dynamic> likes;

  PostController({
    required this.post,
    required this.allLikes,
    required this.likes,
  });

  factory PostController.fromJson(Map<String, dynamic> json) => PostController(
    post: Post.fromJson(json["post"]),
    allLikes: json["all likes"],
    likes: List<dynamic>.from(json["likes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "post": post.toJson(),
    "all likes": allLikes,
    "likes": List<dynamic>.from(likes.map((x) => x)),
  };
}

class Post {
  int id;
  String title;
  String description;
  int userId;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    userId: json["user_id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "user_id": userId,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
