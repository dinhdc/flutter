import 'package:expnse_tracker/widgets/chart/chart.dart';
import 'package:expnse_tracker/widgets/expenses/expense_list.dart';
import 'package:expnse_tracker/models/expense.dart';
import 'package:expnse_tracker/widgets/expenses/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Flutter course',
        amount: 199000,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 120000,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpense.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('No expenses found. Start adding some!'));

    if (_registeredExpense.isNotEmpty) {
      setState(() {
        mainContent = ExpenseList(
          expenses: _registeredExpense,
          onRemoveExpense: _removeExpense,
        );
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Expense Tracker'),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            Chart(
              expenses: _registeredExpense,
            ),
            Expanded(child: mainContent)
          ],
        ));
  }
}
