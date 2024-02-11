import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:newsblog/Post.dart';

class PostProfile extends StatelessWidget {
  const PostProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,top: 10),
          height:30,
          width: 30,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.brown,
              image: DecorationImage(
                  image: AssetImage('images/pelistinegirl.png')
              )
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10,top: 10),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Abdulmateen Maher',style: TextStyle(fontWeight: FontWeight.bold),),
              Text('55m ago',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),)
            ],
          ),
        )
      ],
    );
  }
}

class ReactionButtons extends StatelessWidget {
  const ReactionButtons({
    super.key, required this.writeComment, required this.likeOrDisklike, required this.addToFavorites,this.isFavorite, required this.isLiked,
  });
  final Function() writeComment;
  final Function() likeOrDisklike;
  final Function() addToFavorites;
  final bool isLiked;
  final bool? isFavorite;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding:  EdgeInsets.only(right: 30,top: 10),
          child:  Row(children: [
            GestureDetector(
              onTap:likeOrDisklike,

                child: isLiked==true? Icon(CupertinoIcons.hand_thumbsup):Icon(CupertinoIcons.hand_thumbsup_fill,color: Colors.blue.shade800,)

            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePost()));
              },
                child: Icon(CupertinoIcons.text_bubble_fill)),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: addToFavorites,
              child: isFavorite==true?
              const Icon(CupertinoIcons.heart_fill,color: Colors.red,):const Icon(CupertinoIcons.heart),
            )
          ],),
        )

        // Shimmer3(),
      ],);
  }
}

class Post_Title extends StatelessWidget {
  const Post_Title({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)
            ),
            margin:title.length>30? EdgeInsets.only(bottom: 70):EdgeInsets.only(bottom: 90),
            padding: EdgeInsets.only(left: 10,right: 5),
            width: MediaQuery.of(context).size.width/1.3,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  title.length<30 ?
                  Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),):
                  Text(title.substring(1,30),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                
                ,

                title.length>30 ?
                  Text(' ...',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),):Container()],)
        )
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description, required this.title,
  });
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          description.length<60?
          Text(description):
          Text(description.substring(1,50),),

        Row(
          children: [
          GestureDetector(
              onTap: (){
                showDialog(context: context,
                    builder: (context){
                      return PhysicalModel(
                        color: Colors.white.withOpacity(0.01),
                        borderRadius: BorderRadius.circular(15),
                        elevation: 4,
                        shadowColor: Colors.black,
                        child: Container(
                            margin: EdgeInsets.only(left: 12,right: 12,bottom: 200,top: 100),
                            height: MediaQuery.of(context).size.height-200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: ListView(
                                scrollDirection: Axis.vertical,
                                children:[
                                  Image.asset('images/pelistinegirl.png'),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(children:[
                                        Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                        Text('-----------------------------'),
                                        Text(description,style: TextStyle(fontSize: 18,),softWrap: true,),]))
                                ])),
                      );
                    });
              },

              child:
              description.length>60? const Text(' Read more...  ',style: TextStyle(color: Colors.blue),):Container(),
            )
          ],),

      ],
    );
  }
}
