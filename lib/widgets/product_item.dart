import 'package:flutter/material.dart';
import 'package:flutterdemoapp/screens/products_detail_screen.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
//    final String id;
//    final String title;
//    final String imageUrl;
//
//    ProductItem(this.id, this.title, this.imageUrl);

    @override
    Widget build(BuildContext context) {
        /** listen from Nested Provider (as Product-Grid)
         *
         */
        final product = Provider.of<Product>(context);

        return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
                child: GestureDetector(
                    onTap: () {
                        Navigator.of(context).pushNamed(
                            ProductDetailScreen.routeName,
                            arguments: product.id,
                        );
                    },

                    child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                    ),
                ),

                footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                        icon: product.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                            product.toggleFavoriteStauc();
                        },
                    ),

                    title: Text(
                        product.title,
                        textAlign: TextAlign.center,
                    ),

                    trailing: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {

                        },
                    ),
                ),
            ),
        );
    }
}
