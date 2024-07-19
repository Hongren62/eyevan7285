import 'package:flutter/material.dart';
import 'package:eyevan7285/components/my_drawer.dart';
import 'package:eyevan7285/components/my_product_tile.dart';
import 'package:eyevan7285/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 取得provider中商品
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Shop'),
        actions: [
          // 購物車button
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          SizedBox(height: 25),

          // 商品列表
          SizedBox(
            height: 550,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemCount: products.length,
              itemBuilder: (context, index) {
                // 取得商品
                final product = products[index];

                // 回傳商品UI
                return MyProductTile(product: product);
              },
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Center(
            child: Text(
              'E Y E V A N     I n c .',
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
