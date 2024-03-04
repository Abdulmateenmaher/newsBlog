import 'package:bloc/bloc.dart';
import 'package:newsblog/events/Auth_Event.dart';
import 'package:newsblog/repositories/auth_repository.dart';
import 'package:newsblog/states/auth_State.dart';

import '../models/userDataModel.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
 final AuthRepository authRepository;
 AuthBloc(super.initialState, {required this.authRepository}): assert(authRepository !=null);
 @override
  AuthState get initialState=>AuthInit();
 @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
   if(event is AuthCheck){
   yield AuthLoading();
   final hasToken=await authRepository.hasToken();
   if(hasToken != null){
     yield AuthHasToken(token: hasToken);
   }else{
     yield AuthFailed();
   }
   }
   if(event is GetDataWithToken){
     yield AuthLoading();
     final user= await authRepository.getData(event.token);
   }
   if(event is LoginProcess){
     yield AuthLoading();
     try{
       final login=await authRepository.loginUser(event.email, event.password);
       if(login.message !="failed"){
         yield LoginSuccess();
         await authRepository.setLocalToken(login.data.token);
         yield AuthHasToken(token: login.data.token);
       }
     }catch(e){
       yield LoginFailed( error: 'login gagal');
     }
   }

   if(event is loggedOut){
     final String token=await authRepository.hasToken();
     try{
       final Logout logout= await authRepository.userLogout(token);
       if(logout.message=="success"){
         await authRepository.unSetLocalToken();
         yield AuthFailed();
       }
     }catch(e){

     }
   }
 }
}