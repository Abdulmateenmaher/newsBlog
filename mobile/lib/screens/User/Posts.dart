
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsblog/Model/PostModel.dart';
import 'package:newsblog/Model/userModel.dart';
import 'package:newsblog/bloc/post/bloc.dart';
import 'package:newsblog/bloc/post/states.dart';
import 'package:newsblog/bloc/user/events.dart';
import 'package:newsblog/bloc/user/states.dart';
import 'package:newsblog/repositories/PostRepository.dart';
import 'package:newsblog/repositories/UserRepository.dart';

import '../../bloc/post/events.dart';
import '../../bloc/user/bloc.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
            create: (BuildContext context)=>PostBloc(PostRepository()),
        )
      ], child: Scaffold(
      appBar: AppBar(title: Text('Fetch Users Using Bloc'),),
      body: blocBody(),
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
                  padding: EdgeInsets.all( 10),
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(10),
                    shadowColor: Colors.blueGrey,
                    elevation: 20,
                    color: Colors.white,
                    child: Container(
                      child:  Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text('${postList[index].title}'),
                         ClipRRect(
                             borderRadius: BorderRadius.only(topLeft:Radius.circular(10) ,topRight:Radius.circular(10)),
                             child: Image.asset('images/pelistinegirl.png')),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4,),
                                Text('title: ${postList[index].title}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                SizedBox(height: 4,),
                                Text('description: ${postList[index].description}',style: TextStyle(fontSize: 16),),

                              ],
                            ),
                          )
                       ],),
                      ),
                  ),
                );
              }
          );
        }
        if(state is UserErrorState){
          return Center(
            child: Text("Error"),
          );
        }
        return Container();
      },
    ),
    );
  }
}
