import 'package:expense_app/ui/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/ui/transaction_form.dart';
import 'package:expense_app/ui/transaction_list.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({Key? key, required this.title}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Dinner',
      amount: 35.00,
      date: DateTime.now().subtract(
        const Duration(days: 2),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Breakfast',
      amount: 13.33,
      date: DateTime.now().subtract(
        const Duration(days: 5),
      ),
    ),
    Transaction(
      id: 't3',
      title: 'Padel',
      amount: 5.00,
      date: DateTime.now().subtract(
        const Duration(days: 1),
      ),
    ),
    Transaction(
      id: 't4',
      title: 'Jewelry',
      amount: 125.55,
      date: DateTime.now().subtract(
        const Duration(days: 4),
      ),
    ),
    Transaction(
      id: 't5',
      title: 'Test1',
      amount: 15.45,
      date: DateTime.now().subtract(
        const Duration(days: 4),
      ),
    ),
    Transaction(
      id: 't6',
      title: 'Test2',
      amount: 25.05,
      date: DateTime.now().subtract(
        const Duration(days: 4),
      ),
    ),
    Transaction(
      id: 't7',
      title: 'Test3',
      amount: 100.00,
      date: DateTime.now().subtract(
        const Duration(days: 12),
      ),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((element) => element.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(
        Transaction(
            id: '${DateTime.now()}-title',
            amount: amount,
            title: title,
            date: date),
      );
      _transactions.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void _startAddTransaction() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (buildContext) => SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TransactionForm(onAddTransaction: _addTransaction),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _startAddTransaction,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _startAddTransaction,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: _transactions.isEmpty
            ? Image.asset(
                'assets/images/no-data.png',
              )
            : MediaQuery.of(context).orientation == Orientation.portrait
                ? Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.4,
                        child: Chart(
                          transactions: _recentTransactions,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TransactionList(
                            transactions: _transactions,
                            onDelete: _deleteTransaction,
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Chart(
                          transactions: _recentTransactions,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: TransactionList(
                            transactions: _transactions,
                            onDelete: _deleteTransaction,
                          ),
                        ),
                      )
                    ],
                  ),
      ),
    );
  }
}
