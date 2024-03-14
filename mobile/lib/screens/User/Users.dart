
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsblog/Model/userModel.dart';
import 'package:newsblog/bloc/post/bloc.dart';
import 'package:newsblog/bloc/user/events.dart';
import 'package:newsblog/bloc/user/states.dart';
import 'package:newsblog/repositories/UserRepository.dart';

import '../../bloc/user/bloc.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
            create: (BuildContext context)=>UserBloc(UserRepository()),

        )
      ], child: Scaffold(
      appBar: AppBar(title: const Text('Fetch Users Using Bloc'),),
      body: blocBody(),
      ),
     );
   }
  Widget blocBody(){
    return BlocProvider(
      create: (context)=>UserBloc(
        UserRepository(),
    )..add(LoadUserEvent()),
    child: BlocBuilder<UserBloc,UserState>(
      builder:(context,state){
        if(state is UserLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is UserLoadedState){
          List<UserModel> userList=state.users;
          return ListView.builder(
              itemCount: userList.length,
              itemBuilder:(_,index){
                return Container(
                 margin: const EdgeInsets.only(bottom: 10),
                 padding: const EdgeInsets.only(left: 29),
                 color: Colors.blueGrey.withOpacity(0.5),
                  child:  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                     Text('User ${index+1} Data',style: const TextStyle(fontSize: 20),),
                     const SizedBox(height: 10,),
                     Text('id: ${userList[index].id}'),
                     const SizedBox(height: 4,),
                     Text('name: ${userList[index].name}'),
                     const SizedBox(height: 4,),
                     Text('email: ${userList[index].email}'),
                   ],),
                  );
              }

          );
        }
        if(state is UserErrorState){
          return const Center(
            child: Text("Error"),
          );
        }

        return Container();
      },
    ),

    );
  }

}
