import 'package:flutter/material.dart';
import 'package:minimalecomute/components/My_Drawer.dart';
import 'package:minimalecomute/components/My_ProductTile.dart';
import 'package:minimalecomute/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Shop Page'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart_page');
                },
                icon: Icon(Icons.shopping_cart))
          ]),
      drawer: MyDrawer(),
      body: SizedBox(
        height: 550,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(15),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return MyProductTile(product: product);
            }),
      ),
    );
  }
}
