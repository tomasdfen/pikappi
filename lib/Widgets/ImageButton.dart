import 'package:flutter/material.dart';
import '../app.dart';


class ImageButton extends StatelessWidget {
  final String _image;
  final double _size;
  final Object _route;
  final Object _tip;

  ImageButton(this._image, this._size, this._route, this._tip);

  _onLocationTap(BuildContext context) {
    Navigator.pushNamed(context, _route);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: new EdgeInsets.all(0.0),
        icon: Image.asset('assets/images/'+ _image),
        iconSize: _size,
        tooltip: _tip,
        onPressed: () => _onLocationTap(context)
    );
  }
}