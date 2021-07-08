// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:finacash/bloc/utilisateurs/utilisateur.dart';
// import 'package:finacash/bloc/utilisateurs/utilisateurs.actions.dart';
// import 'package:finacash/bloc/utilisateurs/utilisateurs.state.dart';
// import 'package:finacash/enums/enums.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// import 'package:bloc/bloc.dart';

// class UtilisateursBloc extends Bloc<UtilisateursEvent, UtilisateursState> {
//   UtilisateursService utilisateur;
//   String username, password, email;
//    int id_utilisateur;
//   UtilisateursBloc(
//       UtilisateursState initialState, UtilisateursService utilisateur)
//       : super(initialState);

//   @override
//   Stream<UtilisateursState> mapEventToState(UtilisateursEvent event) async* {
//     if (event is SeConnecterEvent) {

      
//    //   try {
//       //Login 
//         // username = event.username;
//         // password = event.password;
        
//         // var url = "";
//         // var data = {
//         //   "username": username,
//         //   "password": password,
//         // };

//         // var resp = await http.post(url, body: data);

//         // if (resp.statusCode == 200) {
//         //   print(resp.body);
//         //   id_utilisateur = jsonDecode(resp.body);
//         // print(id_utilisateur);

//         //   if (id_utilisateur == 0) {
//         //     yield UtilisateursState(
//         //       requestState: RequestState.NOLOGIN,
//         //     );

//         //     Fluttertoast.showToast(
//         //         msg: "Mot de passe ou nom d'utilisateur incorrecte",
//         //         toastLength: Toast.LENGTH_SHORT,
//         //         gravity: ToastGravity.CENTER,
//         //         timeInSecForIosWeb: 1,
//         //         backgroundColor: Colors.red,
//         //         textColor: Colors.white,
//         //         fontSize: 16.0);
//         //   } else {
//         //       CategoriesState(
//         //       idUtilisateur : id_utilisateur
//         //     );
//         //     yield UtilisateursState(
//         //       requestState: RequestState.LOGIN,
//         //     );
//         //   }
//         // }
//       //     yield UtilisateursState(
//       //         requestState: RequestState.LOGIN,
//       //       );
//       // } catch (e) {
//       //   print(e);
//       //   yield UtilisateursState(
//       //     requestState: RequestState.ERROR,
//       //   );
//       // }
//     } else if (event is AjouterUtilisateurEvent) {
// username =event.username;
// password=event.password;
// email=event.email;
//   bool val=false;
//     try {
//       print("Laila");
//     await FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) async {
//       FirebaseFirestore.instance.collection("Users").doc(value.user.uid).set({
//         'nom': username,
//         'email': email,
//         'solde': 0
//       }).catchError((e) {
//         print("Exception");
//         print(e);
//       });

//     });
//       yield UtilisateursState(
//         requestState: RequestState.REGISTRED,
//       );
//   } on FirebaseAuthException catch (e) {
//  print("Here1");
//     if (e.code == 'weak-password') {
//        Fluttertoast.showToast(
//                 msg: "Il faut que le mot de passe contient au moins 6 caractères",
//                  toastLength: Toast.LENGTH_SHORT,
//                  gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0);
//     } else if (e.code == 'email-already-in-use') {
//             Fluttertoast.showToast(
//                 msg: "L'email existe deja",
//                  toastLength: Toast.LENGTH_SHORT,
//                  gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0);
//     }
//       if (e.code == 'invalid-email') {
//         Fluttertoast.showToast(
//                 msg: "Email invalide",
//                  toastLength: Toast.LENGTH_SHORT,
//                  gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.red,
//                 textColor: Colors.white,
//                 fontSize: 16.0);
//   }
//         yield UtilisateursState(
//         requestState: RequestState.NOTREGISTRED,
//       );
//   } catch (e) {
//     print(e.toString());
// print("Here2");
// yield UtilisateursState(
//         requestState: RequestState.ERROR,
//       );
//   }


    
//       try {
//         yield UtilisateursState();
//       } catch (e) {
//         print(e);
//         yield UtilisateursState();
//       }
//     }
//   }
// }
