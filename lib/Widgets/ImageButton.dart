import 'package:flutter/material.dart';
import '../app.dart';


class ImageButton extends StatelessWidget {
  final String _image;
  final double _size;

  ImageButton(this._image, this._size);

  _onLocationTap(BuildContext context) {
    Navigator.pushNamed(context, PokedexRoute);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: new EdgeInsets.all(0.0),
        icon: Image.asset('assets/images/'+ _image),
        iconSize: _size,
        tooltip: 'Pokedex',
        onPressed: () => _onLocationTap(context)
    );
  }
}