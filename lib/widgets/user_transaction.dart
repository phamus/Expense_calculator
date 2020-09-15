import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transactionList.dart';
import '../models/transaction.dart';

class UserTransacations extends StatefulWidget {
  @override
  _UserTransacationsState createState() => _UserTransacationsState();
}

class _UserTransacationsState extends State<UserTransacations> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: "New Shoe", amount: 10000.00, date: DateTime.now()),
    Transaction(id: 't2', title: "Milk", amount: 1200.00, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

        setState(() {
          _userTransaction.add(newTx)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
