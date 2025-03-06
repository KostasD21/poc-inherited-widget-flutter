import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_poc_inherited_widget/general_expenses.dart';
import 'package:flutter_poc_inherited_widget/travel_expenses.dart';
import 'package:flutter_poc_inherited_widget/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // Initialize the controller
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POC'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.beach_access)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: TabBarView(
        controller: _tabController, 
        children: const [
          GeneralExpensesTab(
            generalExpenses: [1, 2, 3],
          ),
          TravelExpensesTab(
            travelExpenses: [1, 2, 3],
          )
        ]
      ),
    );
  }
}
