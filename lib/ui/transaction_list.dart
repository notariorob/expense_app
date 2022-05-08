import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) => Card(
          elevation: 3,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: FittedBox(
                child: Text(
                  transactions[index].amount.toStringAsFixed(2),
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(
                transactions[index].date,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
