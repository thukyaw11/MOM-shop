import 'package:add_cart/helper/constants.dart';
import 'package:add_cart/model/notifyCount.dart';
import 'package:add_cart/model/productModel.dart';
import 'package:add_cart/ui/data/ProductList.dart';
import 'package:add_cart/ui/partials/AppBar.dart';
import 'package:add_cart/ui/partials/ProductCard.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifyCount = Provider.of<NotifyCount>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                shopName,
                style: TextStyle(fontFamily: defaultFont),
              ),
              accountEmail: Text("kyaw261517@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(shoppingCartTitle),
              onTap: () {
                Navigator.of(context).pushNamed('/product_cart');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text(myAccount),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: BuildBar(
        notifyCount: notifyCount,
        title: homePageTitle,
      ),
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  ProductList productList = ProductList();
  Product product;

  @override
  Widget build(BuildContext context) {
    final notifyCount = Provider.of<NotifyCount>(context);

    return Container(
      color: Colors.white,
      child: GridView.count(
          childAspectRatio: MediaQuery.of(context).size.height / 1400,
          crossAxisCount: 3,
          children: productList.productList
              .map((content) => BuildProductCard(
                  notifyCount: notifyCount, content: content, product: product))
              .toList()),
    );
  }
}
