import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widget/expense_item.dart';
import 'package:flutter/cupertino.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            // Text(expenses[index].title),
            // Text(expenses[index].id),
            // Text("${expenses[index].amount}"),
            ExpenseItem(expenses[index]),
          ],
        );
      });
  }
}
