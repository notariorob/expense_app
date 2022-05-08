import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function onAddTransaction;
  const TransactionForm({Key? key, required this.onAddTransaction})
      : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final String titleValue = titleController.text;
    final double amountValue = double.parse(amountController.text);

    if (titleValue.isEmpty || amountValue <= 0) {
      return;
    }

    widget.onAddTransaction(titleValue, amountValue);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
              controller: amountController,
              onSubmitted: (_) => _submitData(),
            ),
            TextButton(
              onPressed: _submitData,
              child: const Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
