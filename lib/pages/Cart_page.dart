import 'package:flutter/material.dart';
import 'package:minimalecomute/components/My_Button.dart';
import 'package:minimalecomute/components/My_Drawer.dart';
import 'package:minimalecomute/models/product.dart';
import 'package:minimalecomute/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('remove this item from your cart?'),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),

                //add button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeToCart(product);
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text(
                'User wants to pay! Connect this app to your payment backend ',
                style: TextStyle(fontSize: 16),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text('Your Cart is empty...'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toString()),
                        trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove)),
                      );
                    }),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                child: Text(
                  'Pay Now',
                ),
                onTap: () => payButtonPressed(context)),
          ),
        ],
      ),
    );
  }
}
