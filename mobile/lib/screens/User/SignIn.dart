
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsblog/bloc/authUser/authBloc.dart';
import 'package:newsblog/bloc/authUser/events.dart';
import 'package:newsblog/bloc/authUser/states.dart';

import '../../repositories/AuthRepositories.dart';
import 'Posts.dart';
import 'Register.dart';


class Login extends StatefulWidget {
  final AuthBloc authBloc;
  const Login({super.key, required this.authBloc});

  @override
  CheckState createState() => CheckState(authBloc:authBloc);
}

class CheckState extends State<Login> {
  CheckState({required this.authBloc});
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  final AuthBloc authBloc;
  @override
  void initState(){
    super.initState();
  }

  final msg=BlocBuilder<AuthBloc,AuthState>(
    builder: (context,state){
      if(state is LoginErrorState){
        return Text(state.message);
      }else if(state is LoginLoadingState){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return Container();
      }
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context,state){
          if(state is UserLoginSuccessState){
            Navigator.push(context, (MaterialPageRoute(builder: (context)=> Posts(authBloc: authBloc,))));
            //Navigator.pushReplacement(context, (MaterialPageRoute(builder: (context)=>Posts())));
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 30.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, top: 10.0, bottom: 25.0),
                      child: GestureDetector(
                        onTap:(){
                          authBloc.add(LoginButtonPressed(email:emailController.text , password: passwordController.text));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Posts(authBloc: authBloc,)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Text(
                            "Login",
                            style:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: Container(
                alignment: Alignment.center,
                child: const Text("Do not have account?",style: TextStyle(fontSize:16,color: Colors.blueAccent),),
              )),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, top: 10.0, bottom: 25.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, (MaterialPageRoute(builder: (context)=>Register(authBloc:authBloc))));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: BoxDecoration(
                              color: const Color(0xFF3CB371),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Text(
                            "Register",
                            style:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}