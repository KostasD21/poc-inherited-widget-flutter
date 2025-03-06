import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_poc_inherited_widget/home_controller.dart';

class TravelExpensesTab extends StatelessWidget {
  final List<int> travelExpenses;

  const TravelExpensesTab({
    Key? key,
    required this.travelExpenses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the controller
    final controller = Get.find<HomeController>();
    
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Text('Travel Expenses: $travelExpenses'),
              // Use Obx to listen to changes
              Obx(() => Text('Total amount: ${controller.totalAmount.value}')),
              ElevatedButton(
                onPressed: () {
                  controller.addExpense(100);
                },
                child: const Text('Add Expense'),
              ),
              // Use Obx to listen to changes in currentTravel
              Obx(() => controller.currentTravel.value != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: ExpansionTile(
                        title: Row(children: [
                          const SizedBox(width: 12),
                          Text(
                            controller.currentTravel.value!.location,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      )
                    )
                  )
                : Container()
              )
            ],
          ),
        ),
        Positioned(
          left: 16.0,
          bottom: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              controller.deleteCurrentTravel();
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete),
            heroTag: 'deleteButton',
          ),
        ),
      ],
    );
  }
}
