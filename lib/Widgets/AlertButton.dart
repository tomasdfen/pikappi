import 'package:flutter/material.dart';
import '../app.dart';
import '../screens/home/dialog.dart';

class AlertButton extends StatelessWidget {
  final String _image;
  final double _size;

  AlertButton(this._image, this._size);

  _alertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BeautifulAlertDialog();
      },
    );
  }

    @override
    Widget build(BuildContext context) {
      return IconButton(
          padding: new EdgeInsets.all(0.0),
          icon: Image.asset('assets/images/' + _image),
          iconSize: _size,
          tooltip: 'Quiz',
          onPressed: () => _alertDialog(context));
    }
  }

