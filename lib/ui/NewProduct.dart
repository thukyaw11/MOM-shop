import 'package:add_cart/helper/constants.dart';
import 'package:add_cart/model/notifyCount.dart';
import 'package:add_cart/ui/partials/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifyCount = Provider.of<NotifyCount>(context);

    return Scaffold(
      appBar: BuildBar(
        notifyCount: notifyCount,
        title: newProductText,
        tabable: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
