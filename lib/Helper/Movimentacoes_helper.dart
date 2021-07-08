import 'dart:math' show Random;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String movimentacaoTABLE = "movimentacaoTABLE";
final String idColumn = "idColumn";
final String dataColumn = "dataColumn";
final String valorColumn = "valorColumn";
final String tipoColumn = "tipoColumn";
final String descricaoColumn = "descricaoColumn";

class MovimentacoesHelper {
  // static final MovimentacoesHelper _instance = MovimentacoesHelper.internal();

  // factory MovimentacoesHelper() => _instance;

  // MovimentacoesHelper.internal();

  // Database _db;

  // Future<Database> get db async{
  //   if(_db != null){
  //     return _db;
  //   }else{
  //     _db = await initDb();
  //     return _db;
  //   }
  // }

  // Future<Database> initDb()async{
  //   final databasePath = await getDatabasesPath();
  //   final path = join(databasePath, "movimentacao.db");

  // return await openDatabase(path,version: 1,onCreate: (Database db,int newerVersion)async{
  //     await db.execute(
  //       "CREATE TABLE $movimentacaoTABLE(" +
  //       "$idColumn INTEGER PRIMARY KEY,"+
  //       "$valorColumn FLOAT,"+
  //       "$dataColumn TEXT,"+
  //       "$tipoColumn TEXT,"+
  //       "$descricaoColumn TEXT)"

  //     );
  //   });
  // }

  Future<Movimentacoes> saveMovimentacao(Movimentacoes movimentacoes) async {
    var formatterCalendar = new DateFormat('MM-yyyy');
    var dataAtual = new DateTime.now();

    var dataFormatada = formatterCalendar.format(dataAtual);

    try {
      String uid = FirebaseAuth.instance.currentUser.uid;
      print(uid);
      var r = Random();
      String id_transaction = String.fromCharCodes(
          List.generate(20, (index) => r.nextInt(33) + 89));

      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('Transactions')
          .doc();
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        if (!snapshot.exists) {
          documentReference.set({
            'id': id_transaction,
            'date': movimentacoes.data,
            'description': movimentacoes.descricao,
            'montant': movimentacoes.valor,
            'type': movimentacoes.tipo,
            'date_format': dataFormatada
          });
        } else {
          var r = Random();

          String id_transaction = String.fromCharCodes(
              List.generate(20, (index) => r.nextInt(33) + 89));
          documentReference.set({
            'id': id_transaction,
            'date': movimentacoes.data,
            'description': movimentacoes.descricao,
            'montant': movimentacoes.valor,
            'type': movimentacoes.tipo
          });
        }
        return movimentacoes;
      });
    } catch (e) {
      print(e);
      print("Error here in adding new transaction");
    }
  }
  // Future<Movimentacoes> getMovimentacoes(int id)async{
  //   Database dbMovimentacoes = await db;
  //   List<Map> maps = await dbMovimentacoes.query(movimentacaoTABLE,
  //   columns: [idColumn,valorColumn, dataColumn, tipoColumn,descricaoColumn],
  //   where: "$idColumn =?",
  //   whereArgs: [id]);

  //   if(maps.length > 0){
  //     return Movimentacoes.fromMap(maps.first);
  //   }else{
  //     return null;
  //   }
  // }

  Future<bool> loginfirebase(String email, String password) async {
    try {
      var credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      String uid = FirebaseAuth.instance.currentUser.uid;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<int> deleteMovimentacao(Movimentacoes movimentacoes) async {
    String uid = FirebaseAuth.instance.currentUser.uid;

    QuerySnapshot documentReference = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Transactions')
        .get();
    documentReference.docs.forEach(
      (element) {
        if (element.data()['id'] == movimentacoes.id) {
          FirebaseFirestore.instance
              .collection('Users')
              .doc(uid)
              .collection('Transactions')
              .doc(element.reference.id)
              .delete();
        }
      },
    );

    // Database dbMovimentacoes = await db;
    // return await dbMovimentacoes.delete(movimentacaoTABLE,
    // where: "$idColumn =?",
    // whereArgs: [movimentacoes.id]);
  }

  Future<int> updateMovimentacao(Movimentacoes movimentacoes) async {
    print("1");
    String uid = FirebaseAuth.instance.currentUser.uid;
    String idElementToUpdate;
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Transactions')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
if(result.id==movimentacoes.id){   

    idElementToUpdate = result.id;
    print(idElementToUpdate);
    print("2");
           }   });});

      DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Transactions')
        .doc(idElementToUpdate);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      print("3");
        documentReference.set({'id': idElementToUpdate,
            'date': movimentacoes.data,
            'description': movimentacoes.descricao,
            'montant': movimentacoes.valor,
            'type': movimentacoes.tipo,
            'data_format':movimentacoes.data_format});
        
      

   
    });
    // print("chamada update");
    // print(movimentacoes.toString());
    // Database dbMovimentacoes = await db;
    // return await dbMovimentacoes.update(movimentacaoTABLE,movimentacoes.toMap(),
    // where: "$idColumn =?",
    // whereArgs: [movimentacoes.id]
    // );
  }

  Future<List<Movimentacoes>> getAllMovimentacoes() async {
    print("hnaaaaaaa");
    // var index = 0;
//   var formatterCalendar = new DateFormat('MM-yyyy');
//         var dataAtual = new DateTime.now();
//     var dataFormatada = formatterCalendar.format(dataAtual);
    String uid = FirebaseAuth.instance.currentUser.uid;
//     List<Movimentacoes> listMovimentacoes = [];

//     listMovimentacoes =[];
//     Movimentacoes m;
//     final firestoreInstance = FirebaseFirestore.instance;
// firestoreInstance.collection('Users')
//           .doc(uid)
//           .collection('Transactions').get().then((querySnapshot) {
//     querySnapshot.docs.forEach((result) {

//         // print(result);
//           //print(result.data()['type']);
// double doubleVar = result.data()['montant'].toDouble();
//        // Movimentacoes m =Movimentacoes(result.data()["id"], result.data()['date'],result.data()['date_format'],result.data()['description'],result.data()['type'],doubleVar);
// //listMovimentacoes.add(m);
//       // print(m.tipo);
//                m = Movimentacoes(
//           result.data()["id"], result.data()['date'],result.data()['date_format'],result.data()['description'],result.data()['type'],doubleVar);

    // listMovimentacoes[index] = m;
    // index++;
    //    print(result.data()['date_format']);
    //   m.id=result.data()["id"];
    //   m.data=result.data()["date"];
    //   m.tipo=result.data()["type"];
    //   m.descricao=result.data()["description"];
    //   m.data_format=result.data()["date_format"];
    //  m.valor=result.data()["montant"];
    //  listMovimentacoes.add(m);
    //  print(result.data()["type"]);

    //   }

    //   });
    // });
    // print(listMovimentacoes);
    //      return listMovimentacoes;
    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Transactions')
        .get();
    return snapshot.docs
        .map(
          (result) => Movimentacoes(
              result.data()["id"],
              result.data()['date'],
              result.data()['date_format'],
              result.data()['description'],
              result.data()['type'],
              result.data()['montant'].toDouble()),
        )
        .toList();

    // String uid = FirebaseAuth.instance.currentUser.uid;
    // Database dbMovimentacoes = await db;
    // List listMap = await dbMovimentacoes.rawQuery("SELECT * FROM $movimentacaoTABLE");
    // List<Movimentacoes> listMovimentacoes = List();

    // for(Map m in listMap){
    //   listMovimentacoes.add(Movimentacoes.fromMap(m));
    // }
    // return listMovimentacoes;
  }

  Future<List<Movimentacoes>> getAllMovimentacoesPorMes(String data) async {
    var formatterCalendar = new DateFormat('MM-yyyy');
    var dataAtual = new DateTime.now();
    var dataFormatada = formatterCalendar.format(dataAtual);
    String uid = FirebaseAuth.instance.currentUser.uid;
    print(data);
    List<Movimentacoes> listMovimentacoes = List();
    listMovimentacoes = [];
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Transactions')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (result.data()['date_format'] == dataFormatada) {
          print(result);
          print(result.data()['date_format']);
          double doubleVar = result.data()['montant'].toDouble();
          Movimentacoes m = Movimentacoes(
              result.data()["id"],
              result.data()['date'],
              result.data()['date_format'],
              result.data()['description'],
              result.data()['type'],
              doubleVar);
          listMovimentacoes.add(m);
          print(m);
          print("All Mov: $listMovimentacoes");
        }
        print("Two: $listMovimentacoes");
        return listMovimentacoes;
      });
    });
  }

  // Database dbMovimentacoes = await db;
  // List listMap = await dbMovimentacoes.rawQuery("SELECT * FROM $movimentacaoTABLE WHERE $dataColumn LIKE '%$data%'");

  // for(Map m in listMap){
  //   listMovimentacoes.add(Movimentacoes.fromMap(m));
  // }
  // return listMovimentacoes;

  Future<List> getAllMovimentacoesPorTipo(String tipo) async {
    var formatterCalendar = new DateFormat('MM-yyyy');
    var dataAtual = new DateTime.now();
    var dataFormatada = formatterCalendar.format(dataAtual);
    String uid = FirebaseAuth.instance.currentUser.uid;
    List<Movimentacoes> listMovimentacoes = List();
    listMovimentacoes = [];
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance
        .collection('Users')
        .doc(uid)
        .collection('Transactions')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        if (result.data()['type'] == tipo) {
          print(result);
          print(result.data()['type']);
          double doubleVar = result.data()['montant'].toDouble();
          Movimentacoes m = Movimentacoes(
              result.data()["id"],
              result.data()['date'],
              result.data()['date_format'],
              result.data()['description'],
              result.data()['type'],
              doubleVar);
          listMovimentacoes.add(m);
        }
        //    print(result.data()['date_format']);
        //   m.id=result.data()["id"];
        //   m.data=result.data()["date"];
        //   m.tipo=result.data()["type"];
        //   m.descricao=result.data()["description"];
        //   m.data_format=result.data()["date_format"];
        //  m.valor=result.data()["montant"];
        //  listMovimentacoes.add(m);
        //  print(result.data()["type"]);

        //   }
      });
    });
    return listMovimentacoes;
    // String uid = FirebaseAuth.instance.currentUser.uid;
    // Database dbMovimentacoes = await db;
    // List listMap = await dbMovimentacoes.rawQuery("SELECT * FROM $movimentacaoTABLE WHERE $tipoColumn ='$tipo' ");
    // List<Movimentacoes> listMovimentacoes = List();

    // for(Map m in listMap){
    //   listMovimentacoes.add(Movimentacoes.fromMap(m));
    // }
    // return listMovimentacoes;
  }

  // Future<int> getNumber()async{
  //   Database dbMovimentacoes = await db;
  //   return Sqflite.firstIntValue(await dbMovimentacoes.rawQuery(
  //     "SELECT COUNT(*) FROM $movimentacaoTABLE"));
  // }

  // Future close()async{
  //   Database dbMovimentacoes = await db;
  //   dbMovimentacoes.close();
  // }
}

class Movimentacoes {
  String id;
  String data;
  double valor;
  String tipo;
  String descricao;
  String data_format;

  Movimentacoes(this.id, this.data, this.data_format, this.descricao, this.tipo,
      this.valor);
  // Movimentacoes.fromMap(Map map) {
  //   id = map[idColumn];
  //   valor = map[valorColumn];
  //   data = map[dataColumn];
  //   tipo = map[tipoColumn];
  //   descricao = map[descricaoColumn];
  // }

  // Map toMap() {
  //   Map<String, dynamic> map = {
  //     valorColumn: valor,
  //     dataColumn: data,
  //     tipoColumn: tipo,
  //     descricaoColumn: descricao,
  //   };
  //   if (id != null) {
  //     map[idColumn] = id;
  //   }
  //   return map;
  // }

  // String toString() {
  //   return "Movimentaoes(id: $id, valor: $valor, data: $data, tipo: $tipo, desc: $descricao, )";
  // }
}
