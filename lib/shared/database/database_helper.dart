import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';

/// 🗄️ Database Helper - SQLite Configuration & Management (2025)
///
/// This class handles:
/// - Database creation and initialization
/// - Schema management and migrations
/// - Connection management
/// - Error handling and logging
/// - Industry-standard SQLite practices
///
/// Following 2025 best practices:
/// - Single database instance (singleton pattern)
/// - Proper error handling with try-catch
/// - Comprehensive logging for debugging
/// - Foreign key constraints enabled
/// - Optimized for mobile performance
class DatabaseHelper {
  // 🔄 Singleton pattern for database instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // 📋 Database configuration constants
  static const String _databaseName = 'hiccup_profiles_v2.db';
  static const int _databaseVersion = 1;

  // 🏗️ Table names - centralized for easy maintenance
  static const String profilesTable = 'profiles';
  static const String promptsTable = 'prompts';
  static const String pollsTable = 'polls';
  static const String mediaTable = 'media';
  static const String interestsTable = 'interests';
  static const String badgesTable = 'badges';

  /// 🔌 Get database instance (lazy initialization)
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDatabase();
    return _database!;
  }

  /// 🏗️ Initialize database with proper error handling
  Future<Database> _initializeDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, _databaseName);

      debugPrint('🗄️ Initializing database at: $path');

      return await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _createDatabase,
        onUpgrade: _upgradeDatabase,
        onOpen: _onDatabaseOpen,
      );
    } catch (e) {
      debugPrint('❌ Database initialization error: $e');
      rethrow;
    }
  }

  /// 🏗️ Create database tables on first run
  Future<void> _createDatabase(Database db, int version) async {
    debugPrint('🏗️ Creating database tables...');

    try {
      // Enable foreign key constraints
      await db.execute('PRAGMA foreign_keys = ON');

      // Create all tables in dependency order
      await _createProfilesTable(db);
      await _createPromptsTable(db);
      await _createPollsTable(db);
      await _createMediaTable(db);
      await _createInterestsTable(db);
      await _createBadgesTable(db);

      debugPrint('✅ Database tables created successfully');
    } catch (e) {
      debugPrint('❌ Database table creation error: $e');
      rethrow;
    }
  }

  /// 🏗️ Create profiles table - FULL SCHEMA to match ProfileModel
  Future<void> _createProfilesTable(Database db) async {
    await db.execute('''
      CREATE TABLE $profilesTable (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        age INTEGER NOT NULL,
        location TEXT NOT NULL,
        gender TEXT NOT NULL,
        sexual_orientation TEXT,
        bio TEXT,
        dating_goals TEXT,
        music TEXT,
        photo_verification INTEGER DEFAULT 0,
        identity_verification INTEGER DEFAULT 0,
        premium TEXT,
        instagram_url TEXT,
        spotify_url TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        prompt_ids TEXT DEFAULT '[]',
        active_poll_id TEXT,
        media_ids TEXT DEFAULT '[]',
        interest_ids TEXT DEFAULT '[]',
        badge_ids TEXT DEFAULT '[]'
      )
    ''');
  }

  /// 🏗️ Create prompts table - FULL SCHEMA to match PromptModel
  Future<void> _createPromptsTable(Database db) async {
    await db.execute('''
      CREATE TABLE $promptsTable (
        id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        question TEXT NOT NULL,
        response TEXT NOT NULL,
        display_order INTEGER NOT NULL,
        created_at TEXT NOT NULL,
        FOREIGN KEY (profile_id) REFERENCES $profilesTable (id) ON DELETE CASCADE
      )
    ''');
  }

  /// 🏗️ Create polls table - FULL SCHEMA to match PollModel
  Future<void> _createPollsTable(Database db) async {
    await db.execute('''
      CREATE TABLE $pollsTable (
        id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        question TEXT NOT NULL,
        options TEXT NOT NULL,
        is_active INTEGER DEFAULT 1,
        votes TEXT DEFAULT '{}',
        total_votes INTEGER DEFAULT 0,
        created_at TEXT NOT NULL,
        FOREIGN KEY (profile_id) REFERENCES $profilesTable (id) ON DELETE CASCADE
      )
    ''');
  }

  /// 🏗️ Create media table - FULL SCHEMA to match MediaModel
  Future<void> _createMediaTable(Database db) async {
    await db.execute('''
      CREATE TABLE $mediaTable (
        id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        type TEXT NOT NULL,
        file_path TEXT NOT NULL,
        caption TEXT,
        file_size_bytes INTEGER DEFAULT 0,
        duration_seconds INTEGER,
        width INTEGER,
        height INTEGER,
        thumbnail_path TEXT,
        display_order INTEGER NOT NULL,
        is_processing INTEGER DEFAULT 0,
        is_visible INTEGER DEFAULT 1,
        created_at TEXT NOT NULL,
        FOREIGN KEY (profile_id) REFERENCES $profilesTable (id) ON DELETE CASCADE
      )
    ''');
  }

  /// 🏗️ Create interests table - FULL SCHEMA to match InterestModel
  Future<void> _createInterestsTable(Database db) async {
    await db.execute('''
      CREATE TABLE $interestsTable (
        id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        interest TEXT NOT NULL,
        display_name TEXT,
        category TEXT,
        is_custom INTEGER DEFAULT 0,
        display_order INTEGER,
        popularity INTEGER DEFAULT 0,
        created_at TEXT NOT NULL,
        FOREIGN KEY (profile_id) REFERENCES $profilesTable (id) ON DELETE CASCADE
      )
    ''');
  }

  /// 🏗️ Create badges table - FULL SCHEMA to match BadgeModel
  Future<void> _createBadgesTable(Database db) async {
    await db.execute('''
      CREATE TABLE $badgesTable (
        id TEXT PRIMARY KEY,
        profile_id TEXT NOT NULL,
        badge TEXT NOT NULL,
        type TEXT NOT NULL,
        description TEXT,
        icon_url TEXT,
        color TEXT,
        is_visible INTEGER DEFAULT 1,
        is_rare INTEGER DEFAULT 0,
        earned_at TEXT,
        expires_at TEXT,
        created_at TEXT NOT NULL,
        FOREIGN KEY (profile_id) REFERENCES $profilesTable (id) ON DELETE CASCADE
      )
    ''');
  }

  /// 🔄 Handle database upgrades (for future schema changes)
  Future<void> _upgradeDatabase(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    debugPrint('🔄 Upgrading database from $oldVersion to $newVersion');

    // Add migration logic here for future schema changes
    // Example:
    // if (oldVersion < 2) {
    //   await db.execute('ALTER TABLE profiles ADD COLUMN new_field TEXT');
    // }
  }

  /// 🔓 Configure database on open
  Future<void> _onDatabaseOpen(Database db) async {
    debugPrint('🔓 Database opened successfully');

    // Enable foreign key constraints
    await db.execute('PRAGMA foreign_keys = ON');

    // Optimize database performance
    await db.execute('PRAGMA cache_size = 10000');
    await db.execute('PRAGMA temp_store = MEMORY');
  }

  /// 🧹 Close database connection
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
      debugPrint('🔒 Database connection closed');
    }
  }

  /// 🧹 Delete database (for testing/reset purposes)
  Future<void> deleteDatabase() async {
    try {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, _databaseName);

      await databaseFactory.deleteDatabase(path);
      _database = null;

      debugPrint('🗑️ Database deleted successfully');
    } catch (e) {
      debugPrint('❌ Database deletion error: $e');
      rethrow;
    }
  }

  /// 🔍 Check if database exists
  Future<bool> databaseExists() async {
    try {
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, _databaseName);

      return await databaseFactory.databaseExists(path);
    } catch (e) {
      debugPrint('❌ Database existence check error: $e');
      return false;
    }
  }

  /// 📊 Get database information for debugging
  Future<Map<String, dynamic>> getDatabaseInfo() async {
    try {
      final db = await database;
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, _databaseName);

      return {
        'path': path,
        'version': await db.getVersion(),
        'isOpen': db.isOpen,
        'tables': await _getTableNames(db),
      };
    } catch (e) {
      debugPrint('❌ Database info retrieval error: $e');
      return {};
    }
  }

  /// 📋 Get all table names (for debugging)
  Future<List<String>> _getTableNames(Database db) async {
    final result = await db.query(
      'sqlite_master',
      columns: ['name'],
      where: 'type = ?',
      whereArgs: ['table'],
    );

    return result.map((row) => row['name'] as String).toList();
  }

  /// 🔢 Get table row count (for debugging)
  Future<int> getTableRowCount(String tableName) async {
    try {
      final db = await database;
      final result = await db.rawQuery(
        'SELECT COUNT(*) as count FROM $tableName',
      );
      return result.first['count'] as int;
    } catch (e) {
      debugPrint('❌ Table row count error: $e');
      return 0;
    }
  }

  /// 🧪 Reset database for testing
  Future<void> resetDatabase() async {
    try {
      await close();
      await deleteDatabase();
      await database; // Reinitialize
      debugPrint('🔄 Database reset completed');
    } catch (e) {
      debugPrint('❌ Database reset error: $e');
      rethrow;
    }
  }
}

/// 🎯 Database Helper Extensions - Additional utility methods
extension DatabaseHelperExtensions on DatabaseHelper {
  /// 📊 Get comprehensive database statistics
  Future<Map<String, dynamic>> getStatistics() async {
    try {
      final db = await database;

      return {
        'profiles': await getTableRowCount(DatabaseHelper.profilesTable),
        'prompts': await getTableRowCount(DatabaseHelper.promptsTable),
        'polls': await getTableRowCount(DatabaseHelper.pollsTable),
        'media': await getTableRowCount(DatabaseHelper.mediaTable),
        'interests': await getTableRowCount(DatabaseHelper.interestsTable),
        'badges': await getTableRowCount(DatabaseHelper.badgesTable),
        'database_info': await getDatabaseInfo(),
      };
    } catch (e) {
      debugPrint('❌ Statistics retrieval error: $e');
      return {};
    }
  }

  /// 🔍 Check database health
  Future<bool> isHealthy() async {
    try {
      final db = await database;
      await db.rawQuery('SELECT 1');
      return true;
    } catch (e) {
      debugPrint('❌ Database health check failed: $e');
      return false;
    }
  }
}
