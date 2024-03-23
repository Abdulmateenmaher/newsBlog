
  import 'dart:convert';

import 'package:http/http.dart%20';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/constatants.dart';
import '../Model/PostModel.dart';

class PostRepository{
  String userUrl='$baseUrl/posts';
  Future<List<PostModel>?> getPosts() async{
  var prefs=await SharedPreferences.getInstance();
  String? token=prefs.getString('token');
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
    }}
  }


