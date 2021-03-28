import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Flutter Demo')
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red
        ),
        child: Text('')
      ),
    );
  }
}
