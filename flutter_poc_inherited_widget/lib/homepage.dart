import 'package:flutter/material.dart';
import 'package:flutter_poc_inherited_widget/general_expenses.dart';
import 'package:flutter_poc_inherited_widget/travel_expenses.dart';
import 'package:flutter_poc_inherited_widget/travel_period.dart';

// Create an InheritedWidget to hold the state
class HomePageInherited extends InheritedWidget {
  final _MyHomePageState state;

  const HomePageInherited({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  static _MyHomePageState of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<HomePageInherited>();
    assert(result != null, 'No HomePageInherited found in context');
    return result!.state;
  }

  @override
  bool updateShouldNotify(HomePageInherited oldWidget) {
    //return state != oldWidget.state;
    return true;
  }
}

// Make MyHomePage a StatefulWidget instead of InheritedWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int totalAmount = 0;
  TravelPeriod? currentTravel = TravelPeriod(1, 'London', 'GBP', 'Active');
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    //_tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    //_tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  // void _handleTabChange() {
  //   setState(() {});
  // }

  // Add methods that children can call to modify state
  void addExpense(int amount) {
    setState(() {
      totalAmount += amount;
    });
  }

  void deleteCurrentTravel() {
    setState(() {
      // Reset or remove current travel period
      currentTravel = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomePageInherited(
      state: this,
      child: Scaffold(
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
        // Add Floating Action Button here
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            elevation: 4, // Makes it float above the card
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.add, color: Colors.white, size: 32))
        ,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: TabBarView(controller: _tabController, children: const [
          GeneralExpensesTab(
            generalExpenses: [1, 2, 3],
          ),
          TravelExpensesTab(
            travelExpenses: [1, 2, 3],
          )
        ]),
      ),
    );
  }
}
