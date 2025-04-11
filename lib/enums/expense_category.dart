import 'package:hive/hive.dart';

@HiveType(typeId: 1)
enum ExpenseCategory {
  @HiveField(0)
  food,
  @HiveField(1)
  transport,
  @HiveField(2)
  entertainment,
  @HiveField(3)
  shopping,
  @HiveField(4)
  utilities,
  @HiveField(5)
  healthcare,
  @HiveField(6)
  education,
  @HiveField(7)
  other,
}
