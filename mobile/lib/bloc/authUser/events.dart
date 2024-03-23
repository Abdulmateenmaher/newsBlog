import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent extends Equatable{

  @override
  List<Object?> get props => [];
  const AuthEvent();
}

class StartEvent extends AuthEvent{}

class AuthCheck extends AuthEvent{}

class LoadUserEvent extends AuthEvent{}

class LoginButtonPressed extends AuthEvent{
  final String email;
  final String password;
  const LoginButtonPressed({required this.email,required this.password});

}

/// Register Event


class StartsEvent extends AuthEvent{}

class RegisterLoadingEvent extends AuthEvent{}

class RegisterButtonPressed extends AuthEvent{
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  const RegisterButtonPressed({required this.name, required this.passwordConfirmation, required this.email,required this.password});

}


