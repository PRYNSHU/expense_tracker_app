import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //method 1
  // var titleInput = "";
  // void enterTitleInput(String inputValue) {
  //   titleInput = inputValue;
  // }

  //method 2
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  
  void showDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year,now.month, now.day), 
      firstDate: DateTime(2001), 
      lastDate: DateTime(2030),
    );
    // this line will execute after date is picked
    print(pickedDate);

    setState(() { selectedDate = pickedDate; });

  }

  @override
  //this method always called(itself) at last when UI is destroying
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            // onChanged: enterTitleInput,
            maxLength: 100,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text("amount"),
                  ),
                ),
              ),
              const SizedBox(width: 18),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(selectedDate == null 
                    ? "not selected" 
                    : DateFormat.yMd().format(selectedDate!)),

                    IconButton(
                      onPressed: showDate,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(titleController.text);
                  print("-----> ${amountController.text}");
                },
                child: const Text("save Expenses"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
