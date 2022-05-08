import 'package:expense_app/ui/transaction_list_item_alt.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function onDelete;
  const TransactionList(
      {Key? key, required this.transactions, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) => TransactionListItem(
        transaction: transactions[index],
        onDelete: () => onDelete(transactions[index].id),
      ),
    );
  }
}
