import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../Model/userModel.dart';



@immutable
abstract class UserState extends Equatable{}
///data loading state

class UserLoadingState extends UserState{
  @override
  List<Object?> get props=>[];
}

/// data loaded state
 class UserLoadedState extends UserState{
  final List<UserModel> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props=>[users];
}



/// data loading error state
///
 class UserErrorState extends UserState{
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props=>[error];
}

/// Add users state
class UserAddingState extends UserState{
 @override
 List<Object?> get props=>[];
}

/// user added state
class UserAddedState extends UserState{
 final List<UserModel> users;
 UserAddedState(this.users);
 @override
 List<Object?> get props=>[users];
}