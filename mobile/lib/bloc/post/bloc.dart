
import 'package:bloc/bloc.dart';
import 'package:newsblog/bloc/post/states.dart';

import '../../repositories/PostRepository.dart';
import 'events.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  final PostRepository _postRepository;
  PostBloc(this._postRepository):super(PostLoadingState()){
    on<PostEvent>((event,emit) async{
      if(event is LoadPostEvent || event is RefreshPostEvent) {
        emit(PostLoadingState());
      }
      try{
        final posts=await _postRepository.getPosts();
        await Future.delayed(
              const Duration(seconds: 1),
            );
        emit(PosLoadedState(posts!));
      }catch(e){
        emit(PostErrorState(e.toString()));
      }
    });



  }
}