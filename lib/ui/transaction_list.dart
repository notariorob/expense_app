import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/ui/transaction_list_item.dart';

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
        itemBuilder: (context, index) => TransactionListItem(
          transaction: transactions[index],
        ),
      ),
    );
  }
}
