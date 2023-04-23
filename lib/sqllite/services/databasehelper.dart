import 'package:sqflite/sqflite.dart';
import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }
  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'products.db'),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE products (
              id INTEGER PRIMARY KEY AUTOINCREMENT,              
              name TEXT NOT NULL,
              code TEXT NOT NULL, 
              category TEXT NOT NULL, 
              description TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
  }

  Future<int> insertProduct(Product product) async {
    int result = await db.insert('products', product.toMap());
    return result;
  }

  Future<int> updateProduct(Product product) async {
    int result = await db.update(
      'products',
      product.toMap(),
      where: "id = ?",
      whereArgs: [product.id],
    );
    return result;
  }

  Future<List<Product>> retrieveProducts() async {
    final List<Map<String, Object?>> queryResult = await db.query('products');
    return queryResult.map((e) => Product.fromMap(e)).toList();
  }

  Future<void> deleteProduct(int id) async {
    await db.delete(
      'products',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
