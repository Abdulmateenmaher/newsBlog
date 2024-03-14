
class PostModel{
  int? id;
  String? title;
  String?  description;

  PostModel({this.id, this.title, this.description});

  PostModel.fromJson(Map<String, dynamic> json){
    id=json['id'];
    title=json['title'];
    description=json['description'];
  }

}