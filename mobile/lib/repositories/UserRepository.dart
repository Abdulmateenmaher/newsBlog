
  import 'dart:convert';

import 'package:http/http.dart%20';
import 'package:newsblog/Constants/constatants.dart';
import 'package:newsblog/Model/userModel.dart';

class UserRepository{
  String userUrl='http://192.168.1.103:8000/api/users';
  Future<List<UserModel>?> getUsers() async{
  String token=bearer;

    Response response=await get(Uri.parse(userUrl),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode==200){
      final List result=jsonDecode(response.body)['data'];
      return result?.map((e) => UserModel.fromJson(e)).toList()??[];
    }else{
      throw Exception(response.reasonPhrase);
    }


  }
  }