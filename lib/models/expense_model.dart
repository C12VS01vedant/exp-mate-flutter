import 'package:equatable/equatable.dart';
import 'package:expense_offline_repository/enums/expense_category.dart';
import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject with EquatableMixin {
  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final ExpenseCategory category;
  @HiveField(4)
  final DateTime date;

  String getCategoryString() {
    return category.name;
  }

  static ExpenseCategory categoryFromString(String categoryStr) {
    return ExpenseCategory.values.firstWhere(
      (e) => e.name == categoryStr,
      orElse: () => ExpenseCategory.other,
    );
  }

  @override
  List<Object?> get props => [id, title, amount, category, date];
}
