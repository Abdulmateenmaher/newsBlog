

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../blocs/Auth_bloc.dart';

class LoginPage extends StatefulWidget {
  final authBloc;
   LoginPage({super.key, this.authBloc});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc get _authBloc=>widget.authBloc;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context)=>_authBloc,
      child: LoginForm(
        authBloc:_authBloc
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key, required this.authBloc,
  });
 final AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/pelistingirl.png')
                  )
              ),
                padding: EdgeInsets.only(left: 25,right: 25),
                alignment: Alignment.center,
                child: ListView(
    
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 120,),
                    Container(
    
                      alignment: Alignment.center,
                        child: Text('login',style: TextStyle(fontSize: 44,fontWeight: FontWeight.bold),)),
                    SizedBox(height: 30,),
                    SizedBox(height: 18,),
                    Text('email',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 18,),
                    TextField(
                    ),
                    SizedBox(height: 18,),
                    Text('password',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 18,),
                    TextField(
                    ),
                    SizedBox(height: 18,),
                    TextButton(onPressed: (){}, child: Text('submit',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),))
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
