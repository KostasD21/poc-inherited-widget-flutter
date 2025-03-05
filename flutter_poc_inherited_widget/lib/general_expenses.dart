import 'package:flutter/material.dart';
import 'package:flutter_poc_inherited_widget/homepage.dart';

class GeneralExpensesTab extends StatelessWidget {
  final List<int> generalExpenses;

  const GeneralExpensesTab({
    Key? key,
    required this.generalExpenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageState = HomePageInherited.of(context);
    return Container(
      child: Column(
        children: [
          Text('General Expenses: $generalExpenses'),
          Text('Total amount: ${homePageState.totalAmount}'),
          ElevatedButton(
            onPressed: () {
              homePageState.addExpense(100);
            },
            child: const Text('Add Expense'),
          ),
          if (homePageState.currentTravel != null)
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                    child: ExpansionTile(
                title: Row(children: [
                  const SizedBox(width: 12),
                  Text(
                    homePageState.currentTravel!.location,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              )))
        ],
      ),
    );
  }
}
