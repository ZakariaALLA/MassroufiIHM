

import 'package:finacash/screen/InicialPage.dart';
import 'package:finacash/screen/welcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'bloc/transactions/transaction.dart';
import 'bloc/transactions/transactions.bloc.dart';
import 'bloc/transactions/transactions.state.dart';
import 'bloc/utilisateurs/utilisateur.dart';
import 'bloc/utilisateurs/utilisateurs.bloc.dart';
import 'bloc/utilisateurs/utilisateurs.state.dart';
import 'enums/enums.dart';
import 'ocr/ocr.dart';



Future<void> main()  async {
   

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   //GetIt.instance.registerLazySingleton(() => new UtilisateursService());
    initializeDateFormatting().then((_) {
        runApp(MyApp());
});
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
  
     

        // BlocProvider(
        //   create: (context) => TransactionsBloc(
        //     TransactionsState(requestState: RequestState.NONE),
        //   ),
        // ),
        // BlocProvider(create: (context)=>PharmaciesBloc(
        //   initialState: PharmaciesState.initialState(),
        //   messagesRepository: GetIt.instance<PharmaciesRepository>()
        // )
        // BlocProvider(
        //   create: (context) => UtilisateursBloc(
        //     UtilisateursState(requestState: RequestState.NONE),
        //     GetIt.instance<UtilisateursService>(),
        //   ),
        // ),
      
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Money Tracker',
        theme: ThemeData(
          primaryColor: Colors.indigo[900],
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                button: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline1: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
        routes: {
          "/": (_) => InicialPage(),
          "/Welcome": (_) => WelcomePage(),
          "/ocr": (_) => CameraPage(),
          //"/logout" : (_) => WelcomePage(),
          //"/contact": (_) => HomeScreen(),
          //"/profile": (_) => HomeScreen(),
          //"/compte": (_) => ComptePage(),
         // "/sorties": (_) => SortiesPage(),
          //"/entrees": (_) => EntreesPage(),
          //"/new_transaction": (_) => NewTransaction(),
          //"/programmer_transaction": (_) => TransactionRec(),
          // "/new_transaction": (_) => NewTransaction(),
        },
        initialRoute: "/Welcome",
      );
    
  }
}



