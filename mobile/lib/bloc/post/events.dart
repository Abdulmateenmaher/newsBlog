import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PostEvent extends Equatable{
  @override
  List<Object?> get props=>[];
  const PostEvent();
}

class LoadPostEvent extends PostEvent{
}
class RefreshPostEvent extends PostEvent{}