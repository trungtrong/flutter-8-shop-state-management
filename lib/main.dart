import 'package:flutter/material.dart';
import 'package:flutterdemoapp/screens/products_detail_screen.dart';
import 'package:provider/provider.dart';

//
import 'package:flutterdemoapp/screens/products_overview_screen.dart';
import 'package:flutterdemoapp/providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                /**
                 * Way 1: ChangeNotifierProvider(
                 *  builder: () => Products()
                 *  )
                 *
                 *  Way2 L using value() constructor
                 */
                ChangeNotifierProvider.value(
                    value: Products(),
                )
            ],
            child: MaterialApp(
                title: 'MyShop',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: Colors.purple,
                    accentColor: Colors.deepOrange,
                    fontFamily: 'Lato'),
                home: ProductsOverviewScreen(),

                routes: {
                    ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()
                },
            ),
        );
    }
}
