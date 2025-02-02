import 'package:flutter/material.dart';
import 'package:minimalecomute/components/My_ListTile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
              const SizedBox(
                height: 25,
              ),
              MyListTile(
                  text: 'Shop',
                  icon: Icons.shopping_bag,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/shop_page');
                  }),
              MyListTile(
                  text: 'Cart',
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MyListTile(
                text: 'LogOut',
                icon: Icons.logout,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/intro_page');
                }),
          ),
        ],
      ),
    );
  }
}
