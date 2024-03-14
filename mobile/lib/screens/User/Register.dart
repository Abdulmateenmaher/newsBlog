import 'package:flutter/material.dart';

import 'Login.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  checkState createState() => checkState();
}

class checkState extends State<SignUp> {
  bool tnc = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme:  const IconThemeData(color: Color(0xFF3CB371)),
      ),
      body: SizedBox(
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
                    "Sign up",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: true,
                decoration: new InputDecoration(labelText: 'Password'),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 5.0, top: 10.0),
                    child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            Text(
                              "I agree to the terms and conditions.",
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xFF3CB371)),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 10.0, bottom: 25.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Color(0xFF3CB371),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Text(
                        "Submit",
                        style:
                        TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Expanded(child: Container(
              alignment: Alignment.center,
              child: const Text("already have account?",style: TextStyle(fontSize:16,color: Colors.blueAccent),),
            )),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets.only(right: 5.0, left: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration:  BoxDecoration(
                            color: Color(0xFF4364A1),
                            borderRadius:  BorderRadius.circular(10.0)),
                        child:  const Text(
                          "Sing In",
                          style:  TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}