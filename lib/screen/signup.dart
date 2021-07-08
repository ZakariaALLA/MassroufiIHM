import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'loginPage.dart';
import 'bezierContainer.dart';

//import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
  
}
  @override
  void initState() {
    Firebase.initializeApp();
  }

class _SignUpPageState extends State<SignUpPage> {
    TextEditingController username = TextEditingController();
        TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();



  void signUp() async {
  bool val=false;
    try {
      print("Laila");
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) async {
      FirebaseFirestore.instance.collection("Users").doc(value.user.uid).set({
        'nom': username.text,
        'email': email.text,
        'solde': 0
      }).catchError((e) {
        print("Exception");
        print(e);
      });

    });
    val = true;
  } on FirebaseAuthException catch (e) {
 print("Here1");

  if (e.code == 'weak-password') {
       Fluttertoast.showToast(
                msg: "Il faut que le mot de passe contienne au moins 6 caractères",
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
    } else if (e.code == 'email-already-in-use') {
            Fluttertoast.showToast(
                msg: "L'email existe deja",
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
    }
      if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
                msg: "Email invalide",
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
  }
        
  } catch (e) {
    print(e.toString());
print("Here2");
  }
  if(val==true){
   Navigator.of(context).pushNamed("/");
  }
  else {
   print("Error");
  }
}

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('retour',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  // Widget _entryField(String title, {bool isPassword = false}) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
         
  //         SizedBox(
  //           height: 10,
  //         ),
  //         TextField(
  //             obscureText: isPassword,
  //             decoration: InputDecoration(
  //                 border: InputBorder.none,
  //                 fillColor: Color(0xfff3f3f4),
  //                 filled: true))
  //       ],
  //     ),
  //   );
  // }

  // // Widget _submitButton() {
  // //   return 
  // // }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Vous possedez un compte ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Connexion',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          /*
          text: 'd',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          */
          children: [
            TextSpan(
              text: 'Mass',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'roufi',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  // Widget _emailPasswordWidget() {
  //   return Column(
  //     children: <Widget>[
  //       _entryField("Username"),
  //       _entryField("Email id"),
  //       _entryField("Password", isPassword: true),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
  children: <Widget>[
    Align(
      alignment: Alignment.centerLeft,
      child: Container(
       
        child:             Text(
            "Nom et prénom",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
      ),
    ),
  ],
),
 SizedBox(
                      height: 20,
                    ),
                             TextField(

                               controller: username,
          //  controller: username,
            
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
  children: <Widget>[
    Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child:             Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
      ),
    ),
  ],
),
         
                             TextField(
                               controller: email,
          //  controller: username,
            
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
                    SizedBox(
                      height: 20,
                    ),
                             Column(
  children: <Widget>[
    Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child:             Text(
            "Mot de passe",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
      ),
    ),
  ],
),
                             TextField(
                               obscureText: true,
          //  controller: username,
            controller: password,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
                    SizedBox(
                      height: 20,
                    ),
                  ButtonTheme(
                    minWidth: 400.0,
                    height: 60.0,
                    child: RaisedButton(
                      color: Colors.lightBlue[700],
                      onPressed: () {
                        signUp();
                      },
                      child: Text(
                        "Inscription",
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
