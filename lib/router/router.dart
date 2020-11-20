import 'package:add_cart/ui/CartList.dart';
import 'package:add_cart/ui/ProductView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case '/product_single_view':
        return CupertinoPageRoute(
            builder: (_) => ProductSingleView(data: arguments));
      case '/product_cart':
        return CupertinoPageRoute(builder: (_) => CartList());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: (Text('Coming Soon')),
        ),
        body: Center(
          child: Text('Coming Soon'),
        ),
      );
    });
  }
}
