import 'package:flutter/material.dart';

import 'Register.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  checkState createState() => checkState();
}

class checkState extends State<Login> {


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
                    "Sign In",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
              ],
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
                        right: 20.0, left: 20.0, top: 10.0, bottom: 25.0),
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
                        Navigator.push(context, (MaterialPageRoute(builder: (context)=>SignUp())));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF3CB371),
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
    );
  }
}