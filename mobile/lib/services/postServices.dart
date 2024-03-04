
import 'package:http/http.dart' as http;
import 'package:newsblog/constants.dart';

Future submitLike(int x,String token) async{
  final likeUrl="$getpostlink/$x/like";
  final uri=Uri.parse(likeUrl);
  final response=await http.post(
    uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
  );
}