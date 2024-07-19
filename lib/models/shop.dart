import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: 'Eyevan7285 - 717E',
        price: 14800,
        description: '簡約的線條充滿細緻精巧，著重質感與細節，突顯文青儒雅與品味格調',
        imagePath: 'assets/glasses_1.webp'),
    Product(
        name: 'Eyevan7285 - 163',
        price: 20800,
        description: '延續EYEVAN所堅持的設計哲學，成為將眼鏡搖身一變成時尚配件的先驅者',
        imagePath: 'assets/glasses_2.webp'),
    Product(
        name: 'Eyevan7285 - 717W',
        price: 17800,
        description: '簡化了原本以厚身板材包覆金屬內圈的設計，營造出簡潔優雅的氛圍',
        imagePath: 'assets/glasses_3.webp'),
    Product(
        name: 'Eyevan7285 - 184',
        price: 19800,
        description: '威靈頓型鏡框線條柔和圓潤，溫文儒雅，框圈整個外沿以線紋裝飾',
        imagePath: 'assets/glasses_4.webp'),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeToCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
