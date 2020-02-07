import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Widget Catalog',
      home: Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              CustomWidget(),
              Text(
                'Part of:\ntarek360.github.io/Flutter-Custom-Widget-Catalog',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

