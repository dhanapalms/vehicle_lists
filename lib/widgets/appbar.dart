import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.purple[900],
      iconTheme: IconThemeData(color: Colors.purple),
    );
  }
}
