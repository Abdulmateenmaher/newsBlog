

import 'package:bloc/bloc.dart';
import 'package:newsblog/bloc/user/events.dart';
import 'package:newsblog/bloc/user/states.dart';
import 'package:newsblog/repositories/UserRepository.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository _userRepository;
  UserBloc(this._userRepository):super(UserLoadingState()){
    on<LoadUserEvent>((event,emit) async{
      emit(UserLoadingState());
      try{
        final users=await _userRepository.getUsers();
        emit(UserLoadedState(users!));
      }catch(e){
        emit(UserErrorState(e.toString()));
      }
     // print('users loaded');

    });
  }
}