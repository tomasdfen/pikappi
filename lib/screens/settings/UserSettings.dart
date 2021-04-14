import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Widgets/ImageButton.dart';
import '../../Models/pokemon.dart';
import '../../Widgets/ScreenSize.dart';
import 'dart:math';
import '../../app.dart';
import '../home/home.dart';

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("DAF6FF"),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.symmetric(vertical:5.0), //padding interior de las letras con el boxdecoration
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: Center(child: Text("Ajustes de Cuenta"))),
              Container(
                margin: const EdgeInsets.only(bottom: 20.0, top:10.0),
                padding: EdgeInsets.symmetric(vertical: 5.0), //padding interior de las letras con el boxdecoration
                // padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: HexColor("ffffff")),

                child: Container(
                  child:Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0, top:10.0),
                        child: Text("Nombre Entrenador"),

                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0, top:10.0),
                        child: Text("Segun row"),
                      )
                    ],
                  )
                ),
              )
            ],
          )),
    );
  }
}

/*
El layouts estará compuesto por un body de una única columna donde dentro habrá 3 containers
que dividen horizontalmente las 3 partes principales de esta ventana, dentro de cada container
se incluira toddo lo necesario para crearlo como en el mockup
*/
