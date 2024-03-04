
import 'package:equatable/equatable.dart';
import 'package:newsblog/states/auth_State.dart';

abstract class AuthEvent extends Equatable{
  @override
  List<Object> get props=>[];
}

class AppStarted extends AuthEvent{}
class AuthCheck extends AuthEvent{}
class GetDataWithToken extends AuthEvent{
  final String token;
  GetDataWithToken({required this.token});
  @override
  List<Object> get props=>[token];
}
class loggedOut extends AuthEvent{}

class LoginProcess extends AuthEvent{
  final String email;
  final String password;
  LoginProcess({required this.email,required this.password});
  @override
  List<Object> get props=>[email,password];
}