import 'package:add_cart/model/productModel.dart';
import 'package:flutter/cupertino.dart';

class NotifyCount with ChangeNotifier {
  int count = 0;
  List cartList = [];
  void increase(Product product, [int productLoopCount = 1]) {
    count++;
    for (int i = 0; i < productLoopCount; i++) {
      cartList.add(product.name);
    }
    notifyListeners();
  }

  void increaseByCount(int productCount) {
    count += productCount;
    notifyListeners();
  }

  void decrease() {
    if (count > 0) {
      count--;
      notifyListeners();
    }
  }

  void clearCart() {
    cartList.clear();
    notifyListeners();
  }
}
