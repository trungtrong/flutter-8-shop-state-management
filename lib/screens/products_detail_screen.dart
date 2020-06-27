import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//
import '../models/product_model.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
//    final String id;
//    final String title;
//    final String description;
//    final double price;
//    final String imageUrl;
//    ProductDetailScreen(
//        this.id,
//        this.title,
//        this.description,
//        this.price,
//        this.imageUrl
//    );
    static const routeName = '/product-detail';

    @override
    Widget build(BuildContext context) {
        final productId = ModalRoute.of(context).settings.arguments as String;
        /**
         * We only want to get data when we tap on item of ProductGrid
         * => We don't want listener when the => listen: false
         */
        final loadedProduct = Provider.of<Products>(context, listen: false).findById(productId);

        return Scaffold(
            appBar: AppBar(
                title: Text(loadedProduct.title)
            ),

            body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        Container(
                            height: 300,
                            width: double.infinity,
                            child: Image.network(
                                loadedProduct.imageUrl,
                                fit: BoxFit.cover,
                            )
                        ),

                        SizedBox(height: 10,),
                        Text(
                            '${loadedProduct.price}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),
                        ),

                        SizedBox(height: 10,),

                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            child: Text(
                                loadedProduct.description,
                                textAlign: TextAlign.center,
                                softWrap: true,
                            ),
                        )
                    ],
                )
            )
        );
    }
}
