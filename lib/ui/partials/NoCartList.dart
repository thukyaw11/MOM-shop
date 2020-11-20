import 'package:flutter/material.dart';

class NoCartList extends StatelessWidget {
  const NoCartList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "စျေးဝယ်ခြင်းထဲတွင် ပစ္စည်းမရှိသေးပါ",
            style: TextStyle(
                fontFamily: 'MyanmarSansPro', fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 30.0,
          ),
          FlatButton(
            color: Colors.orangeAccent,
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Text(
              'ပစ္စည်းတွေကြည့်မယ်',
              style:
                  TextStyle(fontFamily: 'MyanmarSansPro', color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
