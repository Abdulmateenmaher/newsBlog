import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsblog/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:newsblog/shimmers.dart';

void main() {
  runApp(const HomePage());

  BottomNavigationBar(
    backgroundColor: Colors.white,
    iconSize: 30,
    elevation: 8,
    type: BottomNavigationBarType.fixed,
    fixedColor: Colors.black,
    items: [
      BottomNavigationBarItem (
          icon: Icon(Icons.home,size: 30,),


      )
    ],

  );
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int x=0;
  static String title='News Title with las one updated in chile';
  int titleLenght=title.length<30?title.length:30;
  static String description='Honesty is always admired by people in society. It is one of the greatest human qualities. An honest person will choose the path of truth and be virtuous throughout life. The character of an honest person is free from deceptions and accompanies truthfulness and probity in life.Honesty is always admired by people in society. It is one of the greatest human qualities. An honest person will choose the path of truth and be virtuous throughout life. The character of an honest person is free from deceptions and accompanies truthfulness and probity in life. Honesty is always admired by people in society. It is one of the greatest human qualities. An honest person will choose the path of truth and be virtuous throughout life. The character of an honest person is free from deceptions and accompanies truthfulness and probity in life.Honesty is always admired by people in society. It is one of the greatest human qualities. An honest person will choose the path of truth and be virtuous throughout life. The character of an honest person is free from deceptions and accompanies truthfulness and probity in life.';
  int descrlength=description.length<60?title.length:60;

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

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 32,
          currentIndex: x,
          type: BottomNavigationBarType.fixed,

          fixedColor: Colors.black,
          selectedLabelStyle: TextStyle(fontSize: 1),
          unselectedLabelStyle: TextStyle(fontSize: 1),
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
                    Container(
                      color: Colors.white24,
                      height: MediaQuery.of(context).size.height-155,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          for(int i=1; i<10; i++)
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
                                            height: 305,
                                            padding: const EdgeInsets.only(right: 3,bottom: 3),
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // PictureShimmer(),
                                                Image.asset('images/pelistinegirl.png'),
                                                // DescriptionShimmer(),
                                                Description(descrlength: descrlength, description: description, title: title,),
                                                 Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    PostProfile(),
                                                    // ReactionButtonsShimmer(),
                                                    ReactionButtons(writeComment: writeAComment, likeOrDisklike: likeOrDisklike, addToFavorites: addToFavorites,isFavorite: isFavorite, isLiked: isLiked,),
                                                  ],
                                                )

                                              ],
                                            )
                                        ),
                                      ),
                                      Post_Title(titleLenght: titleLenght, title: title),
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
                                                PopupMenuItem(height: 20,
                                                    child: Row(
                                                      children: [
                                                        Text('Edit')
                                                      ],)),
                                                PopupMenuItem(height: 20,
                                                    child: Row(
                                                      children: [
                                                        Text('Edit')
                                                      ],)),

                                          ]),
                                        ),
                                      )



                                    ])),

                        ],
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



