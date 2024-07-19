import 'package:flutter/material.dart';
import 'package:eyevan7285/components/my_button.dart';
import 'package:eyevan7285/models/product.dart';
import 'package:eyevan7285/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // 移除購物車商品
  void removeItemFromCart(BuildContext context, Product product) {
    // 是否移除Dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this glasses from your cart ?'),
        actions: [
          // yes button
          MaterialButton(
            onPressed: () {
              // pop dialiog
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().removeToCart(product);
            },
            child: const Text('Yes'),
          ),

          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  // 付款button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('尚未開放付款'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 取得購物車資訊
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // 購物車列表
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text('Your cart is empty...'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // 取得單項商品
                      final item = cart[index];

                      // 回傳UI
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 20),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).colorScheme.primary),
                          child: Center(
                            child: ListTile(
                              leading: Image.asset(
                                item.imagePath,
                                height: 40,
                              ),
                              title: Text(item.name),
                              subtitle: Text(
                                'NT\$ ' + item.price.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                                onPressed: () =>
                                    removeItemFromCart(context, item),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Center(
                child: Text(
                  'PAY NOW',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
