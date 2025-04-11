part of 'expense_bloc.dart';

abstract class ExpenseEvent {}

class LoadExpenses extends ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  AddExpense(this.expense);
  final ExpenseModel expense;
}

class DeleteExpense extends ExpenseEvent {
  DeleteExpense(this.id);
  final String id;
}

class ClearExpenses extends ExpenseEvent {}
