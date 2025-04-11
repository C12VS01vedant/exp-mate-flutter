import 'package:bloc/bloc.dart';
import 'package:expense_offline_repository/expense_offline_repository.dart';

part 'expense_event.dart';
part 'expense_state.dart';

/// Manages the state of expenses in the application.
///
/// This bloc handles loading, adding, deleting, and clearing expenses
/// through interactions with an [ExpenseOfflineRepository].
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc({required ExpenseOfflineRepository repository})
      : _repository = repository,
        super(ExpenseInitial()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<DeleteExpense>(_onDeleteExpense);
    on<ClearExpenses>(_onClearExpenses);
  }

  final ExpenseOfflineRepository _repository;

  Future<void> _onLoadExpenses(
    LoadExpenses event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());
      final expenses = _repository.getAllExpenses();
      emit(ExpenseLoaded(expenses));
    } catch (error) {
      emit(ExpenseError('Failed to load expenses: $error'));
    }
  }

  Future<void> _onAddExpense(
    AddExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());
      await _repository.addExpense(event.expense);
      final expenses = _repository.getAllExpenses();
      emit(ExpenseLoaded(expenses));
    } catch (error) {
      emit(ExpenseError('Failed to add expense: $error'));
    }
  }

  Future<void> _onDeleteExpense(
    DeleteExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());
      await _repository.deleteExpense(event.id);
      final expenses = _repository.getAllExpenses();
      emit(ExpenseLoaded(expenses));
    } catch (error) {
      emit(ExpenseError('Failed to delete expense: $error'));
    }
  }

  Future<void> _onClearExpenses(
    ClearExpenses event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());
      await _repository.clearAllExpenses();
      emit(ExpenseLoaded([]));
    } catch (error) {
      emit(ExpenseError('Failed to clear expenses: $error'));
    }
  }
}
