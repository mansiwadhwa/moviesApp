
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/Screens/movie_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email="", _username="",_contact="", _password="" ; // variables declared
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passwordController= TextEditingController();
  TextEditingController _usernameController= TextEditingController();
  TextEditingController _contactController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: CircleAvatar(
                child: Icon(
                  Icons.person_add,
                  size: 120.0,
                ),

                radius: 80,
                // backgroundImage: AssetImage('images/add_user.png'),
              ),
              elevation: 18.0,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
            ),
            SizedBox(
              height: 24.0,
            ),
            // Container(
            //   height: 200.0,
            //   child: Icon(
            //     Icons.app_registration,
            //     size: 150.0,
            //   ),
            // ),

            Container(
              child: TextField(
                controller: _emailController,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle( color: Colors.black26),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      // color: Colors.blueAccent,
                      // width: 1.0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe16671), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 50,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: TextField(
                controller: _usernameController,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'UserName',
                  hintStyle: TextStyle( color: Colors.black26),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      // color: Colors.blueAccent,
                      // width: 1.0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe16671), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 50,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 12.0,
            ),

            Container(
              child: TextField(
                controller: _contactController,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle( color: Colors.black26),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      // color: Colors.blueAccent,
                      // width: 1.0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe16671), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 50,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 12.0,
            ),

            Container(
              child: TextField(
                controller: _passwordController,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle( color: Colors.black26),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      // color: Colors.blueAccent,
                      // width: 1.0
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffe16671), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1.0,
                    blurRadius: 50,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Color(0xffe16671),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    signUp();
                    // getprefeb();
                    print(_emailController.text);
                    print(_usernameController.text);
                    print(_contactController.text);
                    print(_passwordController.text);
                  },
                  minWidth: 200.0,
                  height: 50.0,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize : 18.0 ,
                    ),
                  ),
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff8b8b8b),
                ),
                children: [
                  TextSpan(
                    text: 'Already a user?\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: const Color(0xff268cd0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  Future<void> signUp() async {
    // final formState = _formKey.currentState;
    // if( formState.validate()){
    //   formState.save();
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text ,password:_passwordController.text).then((auth
          ){

        FirebaseFirestore.instance.collection("users").doc(auth.user!.uid).set({
          "name": _usernameController.text,
          "e_mail": _emailController.text,
          "phone": _contactController.text,
          "password": _passwordController.text,
          "uuid": auth.user!.uid,

        });
        setprefeb(_usernameController.text, _emailController.text,  auth.user!.uid , _contactController.text);

      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MovieList()),
      );
      AlertDialog(
        title: Center(child: Text("User Added Successfully!")),
      );
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    catch(e){
      print(e);
    }

  }


  void setprefeb(String name, String email, String uuid, String phone)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name,);
    prefs.setString("email", email,);
    prefs.setString("uuid", uuid,);
    prefs.setString("phone", phone,);
  }

  void getprefeb()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString("name");
    print(name);
  }
}