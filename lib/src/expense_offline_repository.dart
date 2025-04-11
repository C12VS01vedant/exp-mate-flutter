import 'package:expense_offline_repository/models/expense_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template expense_offline_repository}
/// offline-expense-repository
/// {@endtemplate}
class ExpenseOfflineRepository {
  static const _expenseBoxName = 'expenses';
  static const _themeKey = 'theme_mode';
  static const _loginStatusKey = 'logged_in';
  static const _subscriptionKey = 'subscription_status';

  late Box<ExpenseModel> _expenseBox;
  late SharedPreferences _prefs;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseModelAdapter());
    _expenseBox = await Hive.openBox<ExpenseModel>(_expenseBoxName);
    _prefs = await SharedPreferences.getInstance();
  }

  // database-hive-methods!
  Future<void> addExpense(ExpenseModel expense) async {
    await _expenseBox.put(expense.id, expense);
  }

  List<ExpenseModel> getAllExpenses() {
    return _expenseBox.values.toList();
  }

  Future<void> deleteExpense(String id) async {
    await _expenseBox.delete(id);
  }

  Future<void> clearAllExpenses() async {
    await _expenseBox.clear();
  }

  // shared-preferences-methods!
  Future<void> setThemeMode(bool isDarkMode) async {
    await _prefs.setBool(_themeKey, isDarkMode);
  }

  bool get isDarkMode => _prefs.getBool(_themeKey) ?? false;

  Future<void> setLoginStatus(bool isLoggedIn) async {
    await _prefs.setBool(_loginStatusKey, isLoggedIn);
  }

  bool get isLoggedIn => _prefs.getBool(_loginStatusKey) ?? false;

  Future<void> setSubscriptionStatus(String isSubscribed) async {
    await _prefs.setString(_subscriptionKey, isSubscribed);
  }

  String get isSubscribed => _prefs.getString(_subscriptionKey) ?? 'free';
}
