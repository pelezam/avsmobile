import 'package:floor/floor.dart';
import 'package:mobile/core/models/product.dart';

@dao
abstract class ProductDao {
  @Query('SELECT * FROM Product')
  Future<List<Product>> findAllProduct();

  @insert
  Future<List<int>> insertProducts(List<Product> products);

  @Query('DELETE FROM Product')
  Future<void> deleteAllProducts();
}
