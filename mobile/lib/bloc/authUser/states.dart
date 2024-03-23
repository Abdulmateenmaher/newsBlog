import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';




@immutable
abstract class AuthState extends Equatable{
  @override
  List<Object?> get props => [];
}

/// log initial state

class AuthInitState extends AuthState{}

///data loading state

class LoginLoadingState extends AuthState{}
/// data loaded state
 class UserLoginSuccessState extends AuthState{}

/// data loading error state
///
 class LoginErrorState extends AuthState{
   final String message;
   LoginErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// Register

/// init state
class RegisterInitState extends AuthState{}

/// success state
class UserRegisterSuccessState extends AuthState{}

/// loading state
class RegisterLoadingState extends AuthState{}

/// error state
class RegisterErrorState extends AuthState{
  final String message;
  RegisterErrorState({required this.message});
}