import 'package:flutter/cupertino.dart';
import 'package:mobile/core/db/dao/product_dao.dart';
import 'package:mobile/core/db/db.dart';
import 'package:mobile/core/models/product.dart';

class ProductViewModel extends ChangeNotifier {
  bool isOverlyDisplayed = false;
  ProductDao _productDao = Db.instance.productDao;
  List<Product> products = [];
  List<Product> productsFiltered = [];

  Future<void> getAllProducts() async {
    products = await _productDao.findAllProduct();
    productsFiltered = List.from(products);
    notifyListeners();
  }

  filterProducts(String text) {
    if (text == '') {
      productsFiltered = List.from(products);
    } else {
      productsFiltered = products.where((product) => product.libelle.toLowerCase().indexOf(text) >= 0).toList();
    }notifyListeners();
  }
}
