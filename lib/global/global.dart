import 'package:flutter/material.dart';

class GlobalParameter {
  static final menus = [
    {
      "title": "Acceuil",
      "route": "/",
      "icon": Icon(
        Icons.home,
        color: Colors.indigo[900],
      )
    },
   /* {
      "title": "OCR",
      "route": "/ocr",
      "icon": Icon(
        Icons.category,
        color: Colors.indigo[900],
      )
    },*/
    // {
    //   "title": "Transaction recurrente",
    //   "route": "/programmer_transaction",
    //   "icon": Icon(
    //     Icons.date_range,
    //     color: Colors.indigo[900],
    //   )
    // },
    // {
    //   "title": "Historique",
    //   "route": "/historique",
    //   "icon": Icon(Icons.history, color: Colors.indigo[900])
    // },
    // {
    //   "title": "Epargne",
    //   "route": "/epargne",
    //   "icon": Icon(
    //     Icons.money_off,
    //     color: Colors.indigo[900],
    //   )
    // },
    // {
    //   "title": "Dettes",
    //   "route": "/dettes",
    //   "icon": Icon(
    //     Icons.attach_money,
    //     color: Colors.indigo[900],
    //   )
    // },
    {
      "title": "Exporter",
      "route": "/exporter",
      "icon": Icon(
        Icons.access_time,
        color: Colors.indigo[900],
      )
    },
    {
      "title": "Profil",
      "route": "/profil",
      "icon": Icon(
        Icons.settings,
        color: Colors.indigo[900],
      )
    },
    {
      "title": "Se déconnecter",
      "route": "/logout",
      "icon": Icon(
        Icons.logout,
        color: Colors.indigo[900],
      )
    },
  ];
}
