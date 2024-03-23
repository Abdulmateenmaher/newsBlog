
import 'package:bloc/bloc.dart';
import 'package:newsblog/bloc/authUser/events.dart';
import 'package:newsblog/bloc/authUser/states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repositories/AuthRepositories.dart';
import '../../repositories/PostRepository.dart';
import '../authUser/events.dart';
import '../authUser/events.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository _userRepository;
  AuthBloc(AuthState initialState, this._userRepository) :super(initialState);


  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield AuthInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      var data = await _userRepository.login(event.email, event.password);
      pref.setString("token",data['token']);
      yield UserLoginSuccessState();
    } else {
      yield LoginErrorState(message: "auth error");
    }



    /// Register
    if (event is StartsEvent) {
      yield RegisterInitState();
    } else if (event is RegisterButtonPressed) {
      yield RegisterLoadingState();
      var data = await _userRepository.register(event.name, event.email, event.password, event.passwordConfirmation);
      yield UserRegisterSuccessState();
      /// LogIn after Registration data
      if(state is UserRegisterSuccessState){
        var data = await _userRepository.login(event.email, event.password);
        pref.setString("token",data['token']);
        yield UserLoginSuccessState();
      }

    } else {
      yield LoginErrorState(message: "auth error");
    }
  }
 }


