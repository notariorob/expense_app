import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  final VoidCallback onDelete;
  final Transaction transaction;
  const TransactionListItem(
      {Key? key, required this.transaction, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Card(
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: FittedBox(
              child: Text(
                transaction.amount.toStringAsFixed(2),
              ),
            ),
          ),
          title: Text(
            transaction.title,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(
              transaction.date,
            ),
          ),
          trailing: constraints.maxWidth > 400
              ? TextButton.icon(
                  icon: const Icon(Icons.delete),
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).errorColor),
                  onPressed: onDelete,
                  label: const Text('Delete'),
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: onDelete,
                ),
        ),
      ),
    );
  }
}
