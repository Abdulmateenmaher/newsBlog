
import 'package:bloc/bloc.dart';
import 'package:newsblog/Model/PostModel.dart';
import 'package:newsblog/bloc/post/states.dart';

import '../../repositories/PostRepository.dart';
import 'events.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  final PostRepository _postRepository;
  PostBloc(this._postRepository):super(PostLoadingState()){
    on<LoadPostEvent>((event,emit) async{
      emit(PostLoadingState());
      try{
        final posts=await _postRepository.getPosts();
        emit(PosLoadedState(posts!));
      }catch(e){
        emit(PostErrorState(e.toString()));
      }
      // print('users loaded');

    });
  }
}