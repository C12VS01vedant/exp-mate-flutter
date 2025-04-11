part of 'expense_bloc.dart';

abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}

class ExpenseLoading extends ExpenseState {}

class ExpenseLoaded extends ExpenseState {
  ExpenseLoaded(this.expense);
  final List<ExpenseModel> expense;
}

class ExpenseError extends ExpenseState {
  ExpenseError(this.message);
  final String message;
}
