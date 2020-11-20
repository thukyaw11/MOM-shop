import 'package:add_cart/model/notifyCount.dart';
import 'package:add_cart/router/router.dart';
import 'package:add_cart/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NotifyCount>(create: (context) => NotifyCount())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: HomePage(),
          onGenerateRoute: RouteGenerator.generateRoute),
    );
  }
}
