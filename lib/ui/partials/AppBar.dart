import 'package:add_cart/helper/constants.dart';
import 'package:add_cart/model/notifyCount.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class BuildBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const BuildBar(
      {Key key,
      @required this.notifyCount,
      @required this.title,
      this.tabable = true,
      this.clearAble = false,
      this.productCount})
      : super(key: key);

  final NotifyCount notifyCount;
  final String title;
  final bool tabable;
  final bool clearAble;
  final int productCount;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        '$title',
        style: TextStyle(fontFamily: defaultFont),
      ),
      actions: [
        if (clearAble && productCount > 0)
          IconButton(
            onPressed: () {
              showAlertDialog(context, notifyCount);
            },
            icon: Icon(Icons.clear_rounded),
          ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
        Badge(
          badgeColor: Colors.orangeAccent,
          position: BadgePosition.topEnd(top: 0, end: 3),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            '${notifyCount.cartList.length}',
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                if (tabable) Navigator.of(context).pushNamed('/product_cart');
              }),
        ),
      ],
    );
  }
}

showAlertDialog(BuildContext context, NotifyCount notifyCount) {
  Widget cancelButton = FlatButton(
    child: Text("မလုပ်တော့ပါ"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget deleteButton = FlatButton(
    child: Text(
      "ဖျက်မယ်",
      style: TextStyle(color: Colors.red),
    ),
    onPressed: () {
      notifyCount.clearCart();
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Confirmation!"),
    content: Text("စျေးဝယ်ခြင်းထဲမှ ပစ္စည်း အကုန်ဖျက်မည် သေချာပါသလား?"),
    actions: [cancelButton, deleteButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
