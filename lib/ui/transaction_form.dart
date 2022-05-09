import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function onAddTransaction;
  const TransactionForm({Key? key, required this.onAddTransaction})
      : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _date = DateTime.now();

  void _submitData() {
    final String titleValue = _titleController.text;
    final double amountValue = double.parse(_amountController.text);

    if (titleValue.isEmpty || amountValue <= 0) {
      return;
    }

    widget.onAddTransaction(titleValue, amountValue, _date);

    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        setState(() {
          _date = selectedDate;
        });
      }
    });
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              controller: _titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormat.yMMMd().format(_date),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: _openDatePicker,
                  child: const Text(
                    'Change date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
