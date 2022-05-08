import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/ui/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;
  const Chart({Key? key, required this.transactions}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final DateTime weekDay =
          DateTime.now().subtract(Duration(days: 6 - index));
      final double amount = transactions
          .where((transaction) =>
              transaction.date.day == weekDay.day &&
              transaction.date.month == weekDay.month &&
              transaction.date.year == weekDay.year)
          .fold(
              0,
              (previousValue, transaction) =>
                  previousValue + transaction.amount);

      return {'day': DateFormat.E().format(weekDay), 'amount': amount};
    });
  }

  double get _totalSpent => transactions.fold(
      0, (previousValue, transaction) => previousValue + transaction.amount);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...groupedTransactionValues.map(
              (val) => Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: val['day'] as String,
                    amount: val['amount'].toString(),
                    ratio: (val['amount'] as double) / _totalSpent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
