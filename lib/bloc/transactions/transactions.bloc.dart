// import 'package:bloc/bloc.dart';
// import 'package:finacash/Helper/Movimentacoes_helper.dart';
// import 'package:finacash/bloc/transactions/transactions.actions.dart';
// import 'package:finacash/bloc/transactions/transactions.state.dart';
// import 'package:finacash/enums/enums.dart';


// class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
//   TransactionsBloc(TransactionsState initialState) : super(initialState);
//             MovimentacoesHelper movimentacoesHelper = MovimentacoesHelper();
//   List<Movimentacoes> listmovimentacoesEntrees = List();
//   List<Movimentacoes> listmovimentacoesSorties = List();

//   @override
//   Stream<TransactionsState> mapEventToState(TransactionsEvent event) async* {
//     if (event is ChargerTransactionsEntreesEvent) {
//       print("Here in transactions");
//       yield TransactionsState(
//           transactions: state.transactions,
//           requestState: RequestState.LOADING,
//           currentTransactionEvent: event);
//       try {
//         //Il faut récupérer la liste (backend Spring)
//     movimentacoesHelper.getAllMovimentacoesPorTipo("r").then((list) {
//         listmovimentacoesEntrees = list;
//       print("All Mov: $listmovimentacoesEntrees");
//       print(listmovimentacoesEntrees);
//     });
  
//         yield TransactionsState(
//             transactions: listmovimentacoesEntrees,
//             requestState: RequestState.LOADED,
//             currentTransactionEvent: event);
//       } catch (e) {
//         print(e);
//         yield TransactionsState(
//             transactions: state.transactions,
//             requestState: RequestState.ERROR,
//             erreur: e.message,
//             currentTransactionEvent: event);
//       }
//     } else if (event is ChargerTransactionsSortiesEvent) {

// print("Here in transactions sorties");
//       yield TransactionsState(
//           transactions: state.transactions,
//           requestState: RequestState.LOADING,
//           currentTransactionEvent: event);
//       try {
              
//     movimentacoesHelper.getAllMovimentacoesPorTipo("d").then((list) {
  
//         listmovimentacoesSorties = list;
    
//       print("All Mov: $listmovimentacoesSorties");
//     });
  

  
//         yield TransactionsState(
//             transactions: listmovimentacoesSorties,
//             requestState: RequestState.LOADED,
//             currentTransactionEvent: event);
//       } catch (e) {
//         print(e);
//         yield TransactionsState(
//             transactions: state.transactions,
//             requestState: RequestState.ERROR,
//             erreur: e.message,
//             currentTransactionEvent: event);
//       }


//     } else if (event is SupprimerTransactionEvent) {
//       // List<Transaction> transactions = state.transactions;
//       // List<Transaction> selected = [...state.selectedTransactions];
//       // for (Transaction t in selected) {
//       //   // Il faut supprimer le message (backend spring)
//       //   transactions.removeWhere((element) => element.id == t.id);
//       // }
//       // TransactionsState transactionsState = TransactionsState(
//       //     transactions: transactions,
//       //     selectedTransactions: selected,
//       //     currentTransactionEvent: event,
//       //     requestState: RequestState.LOADED);
//       // yield transactionsState;
//     } else if (event is AjouterTransactionEvent) {
//       yield TransactionsState(
//           transactions: state.transactions,
//           requestState: RequestState.LOADING,
//           currentTransactionEvent: event);
//       try {
//         yield TransactionsState();
//       } catch (e) {
//         print(e);
//         yield TransactionsState();
//       }
//     }
//   }
// }
