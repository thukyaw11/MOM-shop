import 'package:add_cart/helper/constants.dart';
import 'package:add_cart/model/notifyCount.dart';
import 'package:add_cart/model/productModel.dart';
import 'package:add_cart/ui/partials/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSingleView extends StatefulWidget {
  const ProductSingleView({Key key, @required this.data}) : super(key: key);
  final Product data;
  @override
  _ProductSingleViewState createState() => _ProductSingleViewState();
}

class _ProductSingleViewState extends State<ProductSingleView> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    final notifyCount = Provider.of<NotifyCount>(context);
    return Scaffold(
      appBar: BuildBar(
        notifyCount: notifyCount,
        title: widget.data.name,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Hero(
                        tag: 'productPhoto${widget.data.name}',
                        child: Image.network(
                          widget.data.image,
                          height: 300.0,
                          width: 300.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.data.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: defaultFont),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '${widget.data.remain} ${widget.data.unit} ကျန်',
                              style: TextStyle(fontFamily: defaultFont),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              '$_count',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25, fontFamily: defaultFont),
                            ),
                          ),
                        ),
                        FlatButton(
                          height: double.infinity,
                          onPressed: () {
                            setState(() {
                              if (_count > 0) {
                                _count--;
                              }
                            });
                          },
                          child: Icon(Icons.remove),
                          color: Colors.redAccent,
                        ),
                        FlatButton(
                          height: double.infinity,
                          onPressed: () {
                            setState(() {
                              _count++;
                            });
                          },
                          child: Icon(Icons.add),
                          color: Colors.greenAccent,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 100.0,
                child: RaisedButton(
                  child: Text(
                    "$_count ${widget.data.unit} စျေးဝယ်ခြင်းထဲ ထည့်မယ်",
                    style: TextStyle(
                        fontFamily: defaultFont,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    notifyCount.increase(
                        Product(
                            name: widget.data.name,
                            price: widget.data.price,
                            remain: widget.data.remain,
                            unit: widget.data.unit,
                            image: widget.data.unit),
                        _count);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
