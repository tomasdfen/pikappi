import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
                padding: EdgeInsets.symmetric(
                    vertical:
                        5.0), //padding interior de las letras con el boxdecoration
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Icon(
                        IconData(0xe900, fontFamily: 'MaterialIcons'),
                        color: HexColor("ff7f00"),
                      ),
                    ),
                    Expanded(
                        flex: 6,
                        child: Center(child: Text("Ajuste de Cuenta"))),
                    Expanded(
                      flex: 2,
                      child: Icon(
                        IconData(0xe900, fontFamily: 'MaterialIcons'),
                        color: HexColor("ff7f00"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width *
                    0.9, //creamos una sized box basada directamente en el tamaño actual del contenedor superior
                margin: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                padding: EdgeInsets.symmetric(
                    vertical:
                        5.0), //padding interior de las letras con el boxdecoration
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: HexColor("ffffff")),

                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        widthFactor: 0.5,
                        child: Container(
                          //2 containers para respetar la medida del grande y luego reducirlo al marco de texto para el otro container
                          margin:
                              const EdgeInsets.only(bottom: 20.0, top: 10.0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: HexColor("DAF6FF")),
                          child: Container(
                              child: Center(child: Text("Nombre Entrenador"))),

                          height: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          //Fila dividida por la mitad con los dos containers que contiene entrenador y los datos del perfil
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.asset(
                                    'assets/trainers/' + 'trainer_1' + '.png'),
                              )),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    IconData(0xe621,
                                                        fontFamily:
                                                            'MaterialIcons'),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 9,
                                                  child: Text(
                                                      "Fecha de Nacimiento"),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                    child: Text(
                                                        "aqui va date cumple"))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  IconData(0xe900,
                                                      fontFamily:
                                                          'MaterialIcons'),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Text("Género"),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                  child: Text(
                                                      "aqui va date cumple"))
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                )),
              ),
              Container(
                child: Row(),
              ),
            ],
          )),
    );
  }
}

/*
El layout estará compuesto por un body de una única columna donde dentro habrá 3 containers
que dividen horizontalmente las 3 partes principales de esta ventana, dentro de cada container
se incluirá toddo lo necesario para crearlo como en el mockup
*/
