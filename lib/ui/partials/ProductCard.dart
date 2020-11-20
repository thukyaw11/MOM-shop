import 'package:add_cart/model/notifyCount.dart';
import 'package:add_cart/model/productModel.dart';
import 'package:flutter/material.dart';

class BuildProductCard extends StatelessWidget {
  const BuildProductCard(
      {Key key,
      @required this.notifyCount,
      @required this.content,
      @required this.product})
      : super(key: key);

  final NotifyCount notifyCount;
  final Product product;
  final content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/product_single_view',
          arguments: Product(
              name: content['name'],
              price: content['price'],
              remain: content['remain'],
              unit: content['unit'],
              image: content['image'])),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Hero(
              tag: 'productPhoto${content['name']}',
              child: Stack(
                children: [
                  Center(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/loading.gif',
                      image: '${content['image']}',
                      height: 130.0,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${content['name']}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'MyanmarSansPro'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${content['remain']} ${content['unit']} ကျန်',
                style: TextStyle(fontFamily: 'MyanmarSansPro', fontSize: 11.0),
              ),
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.greenAccent,
                onPressed: () {
                  notifyCount.increase(Product(
                      name: content['name'],
                      price: content['price'],
                      remain: content['remain'],
                      unit: content['unit'],
                      image: content['image']));
                },
                child: Icon(Icons.add)),
          ],
        ),
        margin: EdgeInsets.all(5.0),
      ),
    );
  }
}
