import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

// This line is required for code generation
part 'database_provider.g.dart';

/// 🗄️ Database Provider - Riverpod Provider for Database Access (2025)
///
/// This provider manages the database instance using the modern @riverpod annotation.
/// It provides a singleton database instance throughout the app.
///
/// Usage:
/// ```dart
/// final db = ref.watch(databaseProvider);
/// ```
@riverpod
Future<Database> database(DatabaseRef ref) async {
  final dbHelper = DatabaseHelper();
  return await dbHelper.database;
}

/// 🔍 Database Helper Provider - Access to DatabaseHelper instance
@riverpod
DatabaseHelper databaseHelper(DatabaseHelperRef ref) {
  return DatabaseHelper();
}

/// 📊 Database Statistics Provider - For debugging and monitoring
@riverpod
Future<Map<String, dynamic>> databaseStatistics(
  DatabaseStatisticsRef ref,
) async {
  final dbHelper = ref.watch(databaseHelperProvider);
  return await dbHelper.getStatistics();
}

/// 🔍 Database Health Provider - Check database health
@riverpod
Future<bool> databaseHealth(DatabaseHealthRef ref) async {
  final dbHelper = ref.watch(databaseHelperProvider);
  return await dbHelper.isHealthy();
}
