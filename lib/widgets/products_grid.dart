import 'package:flutter/material.dart';
import 'package:flutterdemoapp/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
    final bool showFavs;

    ProductsGrid(this.showFavs);

    @override
    Widget build(BuildContext context) {
        final productsData = Provider.of<Products>(context);
        final products = productsData.items;

        return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
            ),
            itemCount: products.length,

            /**     14 - Nested Models and Provider
             * When the data of each product is changed
             * => only This Product listen the changes
             * => don't listen from Provider of Main.dart (global Provider)
             *
             * **Requirement:
             * + The Product Model must be with ChangeNotifier Mixin
             *
             */
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: products[index],
                child: ProductItem(
//                    products[index].id,
//                    products[index].title,
//                    products[index].imageUrl,
                ),
            )
        );
    }
}