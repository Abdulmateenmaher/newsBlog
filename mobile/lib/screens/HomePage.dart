import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Post.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x=0;


  bool isFavorite=false;
  dynamic addToFavorites(){
    setState(() {
      isFavorite=!isFavorite;
    });
  }
  dynamic writeAComment(){
    setState(() {

    });
  }
  bool isLiked=false;
  dynamic likeOrDisklike(){
    setState(() {
      isLiked=!isLiked;
    });
  }
  void initState(){
    super.initState();
    getPosts();
  }
  List posts=[];
  String barear='13|fYKr4UhVxViYyM5ybOkz8JmnQYTCdtAIyggZGafD4192f728';
  final uri=Uri.parse(getpostlink);
  Future<List> getPosts () async{
    var response=await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $barear',
        }
    );
    setState(() {
      final json=jsonDecode(response.body) as Map;
      posts=json['posts'];
    });
    print(posts);
    return posts;
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            iconSize: 32,
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.black,
            selectedLabelStyle: const TextStyle(fontSize: 1),
            unselectedLabelStyle: const TextStyle(fontSize: 1),
            items: const [
              BottomNavigationBarItem (
                label: '',
                icon: Icon(Icons.home,),
              ),
              BottomNavigationBarItem (
                label: '',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem (
                  label: '',
                  icon: Icon(CupertinoIcons.plus_circled,size: 50,weight: 10,color: Colors.blueGrey),
                  tooltip: 'create post'

              ),
              BottomNavigationBarItem (
                label: '',
                icon: Icon(Icons.search,),
              ),
              BottomNavigationBarItem (
                label: '',
                icon: Icon(Icons.person,),
              ),
            ],
          ),
          body: PageView(
              scrollDirection: Axis.horizontal,
              children:[
                SafeArea(
                  child: Column(
                    textDirection: TextDirection.ltr,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        height: 70,
                        color: Colors.blueGrey,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.fill,
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/pelistinegirl.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RefreshIndicator(
                        onRefresh: getPosts,
                        child: Container(
                          color: Colors.white24,
                          height: MediaQuery.of(context).size.height-155,
                          child: ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (BuildContext context ,int index){
                              return
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 29),
                                  child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        PhysicalModel(
                                          elevation: 10,
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(10),
                                          shadowColor: Colors.black,
                                          clipBehavior: Clip.antiAlias ,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white,
                                              ),
                                              padding: const EdgeInsets.only(right: 3,bottom: 3),
                                              child:Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  // PictureShimmer(),
                                                  Image.asset('images/pelistinegirl.png'),
                                                  // DescriptionShimmer(),
                                                  Description( description: posts[index]['description'].toString(), title: posts[index]['title'].toString(),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const PostProfile(),
                                                      // ReactionButtonsShimmer(),
                                                      // ReactionButtons(writeComment: writeAComment, likeOrDisklike: likeOrDisklike, addToFavorites: addToFavorites,isFavorite: isFavorite, isLiked: isLiked,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Container(
                                                            padding:  EdgeInsets.only(right: 30,top: 10),
                                                            child:  Row(children: [
                                                              GestureDetector(

                                                                  child: isLiked==true? Icon(CupertinoIcons.hand_thumbsup):Icon(CupertinoIcons.hand_thumbsup_fill,color: Colors.blue.shade800,)
                                                              ),
                                                              SizedBox(width: 20,),
                                                              GestureDetector(
                                                                  onTap: (){
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePost()));
                                                                  },
                                                                  child: Icon(CupertinoIcons.text_bubble_fill)),
                                                              const SizedBox(width: 20,),
                                                              GestureDetector(
                                                                onTap: addToFavorites,
                                                                child: isFavorite==true?
                                                                const Icon(CupertinoIcons.heart_fill,color: Colors.red,):const Icon(CupertinoIcons.heart),
                                                              )
                                                            ],),
                                                          )
                                                          // Shimmer3(),
                                                        ],)
                                                    ],)
                                                ],)
                                          ),
                                        ),
                                        Post_Title( title: posts[index]['title'].toString()),
                                        // TitileShimmer(),
                                        Container(
                                          alignment: Alignment.bottomRight,
                                          height: 200,
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 35),
                                            child: PopupMenuButton(
                                                color: Colors.white,
                                                icon: Icon(Icons.more_horiz,size: 40,color: Colors.black26,),
                                                itemBuilder: (context)=>[
                                                  const PopupMenuItem(height: 20,
                                                      child: Row(
                                                        children: [
                                                          Text('Edit')
                                                        ],)),
                                                  const PopupMenuItem(height: 20,
                                                      child: Row(
                                                        children: [
                                                          Text('Edit')
                                                        ],)
                                                  ),
                                                ]),
                                          ),
                                        )
                                      ])
                              );
                            },
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ])
      ),
    );
  }
}