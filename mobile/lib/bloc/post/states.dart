import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../Model/PostModel.dart';




@immutable
abstract class PostState extends Equatable{}
///data loading state

class PostLoadingState extends PostState{
  @override
  List<Object?> get props=>[];
}
/// data loaded state
 class PosLoadedState extends PostState{
  final List<PostModel> posts;
  PosLoadedState(this.posts);
  @override
  List<Object?> get props=>[posts];
}

/// data loading error state
///
 class PostErrorState extends PostState{
  final String error;
  PostErrorState(this.error);
  @override
  List<Object?> get props=>[error];
}