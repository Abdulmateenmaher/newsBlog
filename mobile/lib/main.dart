

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsblog/bloc/authUser/authBloc.dart';
import 'package:newsblog/bloc/authUser/states.dart';
import 'package:newsblog/repositories/AuthRepositories.dart';
import 'package:newsblog/screens/User/SignIn.dart';
import 'package:newsblog/screens/User/Posts.dart';





void main() {
  final AuthRepository authRepository=AuthRepository();
  runApp(  BlocProvider<AuthBloc>(
      create: (context)=>AuthBloc(AuthInitState(), authRepository),
      child: App(
          authRepository: authRepository,
          authBloc: AuthBloc( AuthInitState(),authRepository),),
  ),);
}

class App extends StatelessWidget {
  final AuthRepository authRepository;
  final AuthBloc authBloc;
  const App({super.key, required this.authRepository, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // Posts()
      BlocBuilder(
        bloc: authBloc,
        builder: (context, state){
          return state is UserLoginSuccessState?Posts(authBloc: authBloc):Login(authBloc: authBloc);
        },
      ),
    );
    // MultiBlocProvider(
    //     providers: [
    //       BlocProvider(create: (context)=>AuthBloc(LoginInitState(), AuthRepository()))
    //     ], child: Login(),
    // ),

  }
}

