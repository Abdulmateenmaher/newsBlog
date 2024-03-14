
  import 'dart:convert';

import 'package:http/http.dart%20';
import 'package:newsblog/Model/userModel.dart';

import '../Constants/constatants.dart';
import '../Model/PostModel.dart';

class PostRepository{
  String userUrl='$baseUrl/posts';
  Future<List<PostModel>?> getPosts() async{
  String token=bearer;

    Response response=await get(Uri.parse(userUrl),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode==200){
      final List result=jsonDecode(response.body)['data'];
      return result.map((e) => PostModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }


  }
  }