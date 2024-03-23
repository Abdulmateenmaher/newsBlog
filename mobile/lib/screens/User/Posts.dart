

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsblog/Model/PostModel.dart';
import 'package:newsblog/bloc/authUser/authBloc.dart';
import 'package:newsblog/bloc/post/bloc.dart';
import 'package:newsblog/bloc/post/states.dart';
import 'package:newsblog/repositories/PostRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/post/events.dart';
import '../../main.dart';
import 'SignIn.dart';

class Posts extends StatefulWidget {
  final AuthBloc authBloc;
  const Posts({super.key, required this.authBloc});

  @override
  State<Posts> createState() => _PostsState(authBloc:authBloc);
}

class _PostsState extends State<Posts> {

  final AuthBloc authBloc;
  _PostsState({required this.authBloc});

  String? token;
  bool logoutCircleProgress=false;

  @override
    initState() {
    super.initState();
  }
  Future<void> _refresh()async {
   initState();
  }

  Future<void> logout()async{
    var prefs=await SharedPreferences.getInstance();
    //token=prefs.getString('token')!;
    prefs.remove('token');
    print('my token may be deleted${prefs.getString('token')} and email is still ok: ${prefs.getString('email')}');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login(authBloc: authBloc,)));
  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: _refresh,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PostBloc>(
              create: (BuildContext context)=>PostBloc(PostRepository()),
          )
        ], child: Scaffold(
        appBar: AppBar(title: const Text('Fetch posts Using Bloc'),actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red.withOpacity(0.1),
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(right: 10),
            child:logoutCircleProgress==true?CircularProgressIndicator():
            GestureDetector(
              onTap: ()async{

                setState(() {
                  logoutCircleProgress=true;
                });

                await Future.delayed(Duration(seconds: 1));
                logout();
              },
              child: const Row(
                children: [
                  Text('Logout',style: TextStyle(fontSize: 20),),
                  Icon(Icons.logout),
                ],
              ),
            )
          )
        ],),
        body: blocBody(),
        ),
       ),
    );
   }
  Widget blocBody(){
    return BlocProvider(
      create: (context)=>PostBloc(
        PostRepository(),
    )..add(LoadPostEvent()),
    child: BlocBuilder<PostBloc,PostState>(
      builder:(context,state){
        if(state is PostLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is PosLoadedState){
          List<PostModel> postList=state.posts;
          return ListView.builder(
              itemCount: postList.length,
              itemBuilder:(_,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all( 10),
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(10),
                    shadowColor: Colors.blueGrey,
                    elevation: 20,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text('${postList[index].title}'),
                       ClipRRect(
                           borderRadius: const BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(10)),
                           child: Image.asset('images/pelistinegirl.png')),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4,),
                              Text('title: ${postList[index].title}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 4,),
                              Text('description: ${postList[index].description}',style: const TextStyle(fontSize: 16),),
                    
                            ],
                          ),
                        )
                     ],),
                  ),
                );
              }
          );
        }
        if(state is PostErrorState){
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
