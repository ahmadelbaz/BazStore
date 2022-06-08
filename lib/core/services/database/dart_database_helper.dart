import 'package:baz_store_new/constants.dart';
import 'package:baz_store_new/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static late Database _database;

  Future<Database> get database async {
    // if (_database != null) return _database;

    _database = await initdb();
    return _database;
  }

  initdb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
  CREATE TABLE $tableCartProduct (
    $columnName TEXT NOT NULL,
    $columnImage TEXT NOT NULL,
    $columnQuantity INTEGER NOT NULL,
    $columnPrice TEXT NOT NULL,
    $columnproductid TEXT NOT NULL)
''');
    });
  }

  Future<List<CartProductModel>> getAllProducts() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);

    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    dbClient.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  update(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient.update(tableCartProduct, model.toJson(),
        where: '$columnproductid = ?', whereArgs: [model.productid]);
  }

  delete(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient.delete(tableCartProduct,
        where: '$columnproductid = ?', whereArgs: [model.productid]);
  }
}
