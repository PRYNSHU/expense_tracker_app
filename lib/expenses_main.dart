import 'package:expense_tracker_app/widget/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpensed = [
    Expense(
      title: "finance",
      amount: 12.5,
      dt: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "business",
      amount: 19.9,
      dt: DateTime.now(),
      category: Category.leisure,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 188, 207, 212),
      body: Column(
        children: [
          const Text("hello"),
          Expanded(
            child: ExpenseList(expenses: registeredExpensed),
          ),
        ],
      ),
    );
  }
}
