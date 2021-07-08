import 'package:finacash/Helper/Movimentacoes_helper.dart';
import 'package:finacash/Widgets/AnimatedBottomNavBar.dart';

import 'package:finacash/bloc/transactions/transactions.actions.dart';
import 'package:finacash/bloc/transactions/transactions.bloc.dart';
import 'package:finacash/bloc/utilisateurs/utilisateur.dart';
import 'package:finacash/bloc/utilisateurs/utilisateurs.bloc.dart';
import 'package:finacash/bloc/utilisateurs/utilisateurs.state.dart';
import 'package:finacash/enums/enums.dart';
import 'package:finacash/screen/DespesasResumo.dart';
import 'package:finacash/screen/HomePage.dart';
import 'package:finacash/screen/ReceitasResumo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

import 'package:table_calendar/table_calendar.dart';

import 'loginPage.dart';

class InicialPage extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Dépenses",
      iconData: Icons.arrow_downward_outlined,
      color: Colors.red,
    ),
    BarItem(
      text: "Accueil",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Entrées",
      iconData: Icons.arrow_upward_outlined,
      color: Colors.green,
    ),
    /*BarItem(
      text: "Search",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
    ),
    */
  ];

  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  int selectedBarIndex = 1;
  int id_utilisateur;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //systemNavigationBarColor: Colors.lightBlue[700], // navigation bar color
        //statusBarColor: Colors.lightBlue[700],
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light // status bar color
        ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    List<Widget> telas = [DespesasResumo(), HomePage(), ReceitasResumo()];

    //_allMov();
    //print("\nMes atual: " + DateTime.now().month.toString());
    return Container(
      child: Scaffold(
          body: telas[selectedBarIndex],
          bottomNavigationBar: AnimatedBottomBar(
            barItems: widget.barItems,
            animationDuration: const Duration(milliseconds: 150),
            barStyle: BarStyle(fontSize: width * 0.045, iconSize: width * 0.07),
            onBarTap: (index) {
              print("Done");
              setState(() {
                //                     if (selectedBarIndex == 0) {
                //   context
                //       .read<TransactionsBloc>()
                //       .add(ChargerTransactionsSortiesEvent());
                // }
                // if (selectedBarIndex == 2) {
                //   context
                //       .read<TransactionsBloc>()
                //       .add(ChargerTransactionsEntreesEvent());
                // }
                selectedBarIndex = index;
              });
              print("Another done");
              print(selectedBarIndex);
            },
          )),
    );
  }
}
