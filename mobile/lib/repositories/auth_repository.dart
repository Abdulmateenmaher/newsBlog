import 'package:http/http.dart' as http;
import 'package:newsblog/constants.dart';
import 'package:newsblog/models/userDataModel.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository{
  Future loginUser(String email, String password)async{
    String baseUrl="$link/login";
    var uri=Uri.parse(baseUrl);
    try{
      var response=await http.post(
        uri,body: {
          'email':email,
          'password': password
      });
      var jsonResponse=json.decode(response.body);
      return LoginAuth.fromJson(jsonResponse);
       }catch(e){
      return e;
    }
  }

  Future userLogout(String token)async{
    String baseurl="$link/logout";
    var uri=Uri.parse(baseurl);
    try{
      var response= await http.post(uri,headers:{
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      });
      
      var responseBody=json.decode(response.body);
      return Logout.fromJson(responseBody);
    }catch(e){
      return e;
    }
  }

  Future getData(String token) async{
    String baseUrl="$link/user";
    var uri=Uri.parse(baseUrl);
    try{
      var response=await http.get(uri,headers: {
        'Authorization': 'Bearer $token',
        'Accept':'application/json'
      });
      var responseBody=json.decode(response.body);
      return User.fromJson(responseBody);
    }catch(e){
      return e;
    }
  }
  Future hasToken()async{
    Future <SharedPreferences> _pref=SharedPreferences.getInstance();
    final SharedPreferences local=await _pref;
    final String? token=local.getString("token_sanctum") ?? null;
    if(token!=null) return token;
    return null;
  }
  
  Future setLocalToken(String token)async{
    Future<SharedPreferences> _prefs=SharedPreferences.getInstance();
    final SharedPreferences local=await _prefs;
    local.setString("token_sanctum", token);
  }

  Future unSetLocalToken()async{
    Future<SharedPreferences> _prefs=SharedPreferences.getInstance();
    final SharedPreferences local=await _prefs;
    local.setString("token_sanctum", "");
  }

}