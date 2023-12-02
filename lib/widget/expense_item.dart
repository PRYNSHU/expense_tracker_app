import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(expense.amount.toStringAsFixed(2)), //12.331 -> 12.33
                const Spacer(), // give space as much as you can!
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    const SizedBox(width: 6),
                    Text(expense.getdateformatter()),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
