import 'package:flutter/material.dart';
import 'package:flutter_poc_inherited_widget/homepage.dart';

class TravelExpensesTab extends StatelessWidget {
  final List<int> travelExpenses;

  const TravelExpensesTab({
    Key? key,
    required this.travelExpenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageState = HomePageInherited.of(context);
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Text('Travel Expenses: $travelExpenses'),
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
        ),
        Positioned(
          left: 16.0,
          bottom: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              homePageState.deleteCurrentTravel();
              // Add delete functionality here
              // You might want to add a method in HomePageInherited for this
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete),
            heroTag: 'deleteButton', // Needed when you have multiple FABs
          ),
        ),
      ],
    );
  }
}
