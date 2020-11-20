import 'package:add_cart/helper/constants.dart';
import 'package:add_cart/model/notifyCount.dart';
import 'package:add_cart/ui/partials/AppBar.dart';
import 'package:add_cart/ui/partials/NoCartList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifyCount = Provider.of<NotifyCount>(context);

    return Scaffold(
      appBar: BuildBar(
        notifyCount: notifyCount,
        title: shoppingCartTitle,
        tabable: false,
        clearAble: true,
        productCount: notifyCount.cartList.length,
      ),
      body: Container(
        child: notifyCount.cartList.length == 0
            ? NoCartList()
            : CartBody(notifyCount: notifyCount),
      ),
    );
  }
}

class CartBody extends StatelessWidget {
  const CartBody({
    @required this.notifyCount,
    Key key,
  }) : super(key: key);
  final NotifyCount notifyCount;

  @override
  Widget build(BuildContext context) {
    var map = Map();

    notifyCount.cartList.forEach((element) {
      if (!map.containsKey(element)) {
        map[element] = 1;
      } else {
        map[element] += 1;
      }
    });

    return ListView.builder(
      itemCount: map.length,
      itemBuilder: (BuildContext context, int index) {
        String key = map.keys.elementAt(index);
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$key"),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text("${map[key]}"))
                ],
              ),
            ),
            Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }
}
