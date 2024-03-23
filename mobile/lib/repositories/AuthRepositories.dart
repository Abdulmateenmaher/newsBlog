import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

import 'package:newsblog/Constants/constatants.dart';

// class AuthRepository{
//   Future login (String email, String password) async{
//     var loginUrl="$baseUrl/login";
//     var uri=Uri.parse(loginUrl);
//     var response=await http.post(
//         uri,
//         headers: {
//         },
//         body: {"email":email,"password":password});
//
//         final data=json.decode(response.body);
//         if(response.statusCode==200){
//           return data;
//         }else{
//           return "auth Problem";
//         }
//   }
// }


class AuthRepository {
  String loginUrl = '$baseUrl/login';

  Future login(String email, String password) async {
    Response response = await http.post(Uri.parse(loginUrl),
        headers: {
          'Accept': 'application/json',
        },
        body: {"email": email, "password": password}

    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


  String registerUrl = '$baseUrl/register';

  Future register(String name, String email, String password,
      String passwordConfirmation) async {
    Response response = await http.post(Uri.parse(registerUrl),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation
        }

    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
