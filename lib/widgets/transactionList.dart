import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: transaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No Transaction yet',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              'N${transaction[index].amount}',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        '${transaction[index].title}',
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transaction[index].date)),
                    ),
                  );
                },
                itemCount: transaction.length,
              ));
  }
}
