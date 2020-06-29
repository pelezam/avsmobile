import 'package:flutter/material.dart';
import 'package:mobile/core/view_models/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductsPageBody();
  }
}

class ProductsPageBody extends StatefulWidget {
  const ProductsPageBody({
    Key key
  }) : super(key: key);

  @override
  _ProductsPageBodyState createState() => _ProductsPageBodyState();
}

class _ProductsPageBodyState extends State<ProductsPageBody> {

  @override
  Widget build(BuildContext context) {
    var productViewModel = Provider.of<ProductViewModel>(context);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(hintText: 'Rechercher un client'),
              onChanged: (text) {
                productViewModel.filterProducts(text);
              },
            ),
          ),
          Expanded(
            child: Consumer<ProductViewModel>(builder: (context, clientViewModel, _) {
              final products = clientViewModel.productsFiltered;
              return ListView.separated(
                  itemCount: products.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.libelle),
                      subtitle: Text(product.status),
                      trailing: Text(product.prix.toString()),
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}
