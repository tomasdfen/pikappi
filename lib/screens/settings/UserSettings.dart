import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mdi/mdi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/ImageButton.dart';
import '../../Models/pokemon.dart';
import '../../Widgets/ScreenSize.dart';
import 'dart:math';
import '../../app.dart';
import '../home/home.dart';

class UserSettings extends StatelessWidget {
  final Image entrenador1 =
      new Image.asset('assets/trainers/' + 'trainer_1' + '.png');
  final Image entrenador2 =
      new Image.asset('assets/trainers/' + 'trainer_1' + '.png');
  final Image entrenador3 =
      new Image.asset('assets/trainers/' + 'trainer_1' + '.png');

  @override
  Widget build(BuildContext context) {
    final List<Image> lista_entrenadores = [
      entrenador1,
      entrenador2,
      entrenador3
    ];

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
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: HexColor("DAF6FF")),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0),
                                                    child: Icon(
                                                      IconData(0xe621,
                                                          fontFamily:
                                                              'MaterialIcons'),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 9,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0),
                                                    child: Text(
                                                        "Fecha de Nacimiento"),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(

                                                width: 100,
                                                height: 50,
                                                child: ClipRRect(

                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: DatePickerDemo(),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  child: Icon(
                                                    IconData(0xeae4,
                                                        fontFamily:
                                                            'MaterialIcons'),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Text("Género"),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 9,
                                                  child: Container(
                                                      height: 40,
                                                      child: Center(
                                                        child: GenderSelector(),
                                                      ))),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  child: Icon(
                                                    IconData(59169,
                                                        fontFamily:
                                                            'MaterialIcons'),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child:
                                                      Text("Pokémon Favorito"),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                      "1 Grid central con el poke"),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                                  child: Icon(
                                                    IconData(0xe6f5,
                                                        fontFamily:
                                                            'MaterialIcons'),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 9,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Text("Experiencia"),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                  child: Center(
                                                child: Text("barra exp"),
                                              )),
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
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor("DAF6FF"),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.topCenter,
                          widthFactor: 0.42,
                          child: Container(
                            //2 containers para respetar la medida del grande y luego reducirlo al marco de texto para el otro container
                            margin:
                                const EdgeInsets.only(bottom: 20.0, top: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Container(
                                child: Center(
                                    child:
                                        Text("Elige tu foto de entrenador"))),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          child: GridView.count(
                            childAspectRatio: 1.0,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            crossAxisCount: 2,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25,
                            children: [],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor("DAF6FF"),
                          ),
                          // alignment: Alignment.centerRight,
                          child: AppBar(
                            leading: BackButton(
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

int _value = 1;

class GenderSelector extends StatefulWidget {
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("DAF6FF"),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => setState(() => _value = 0),
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: _value == 0 ? Colors.pinkAccent : Colors.transparent,
              ),
              child: Icon(Mdi.genderFemale),
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: () => setState(() => _value = 1),
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: _value == 1 ? Colors.blueAccent : Colors.transparent,
              ),
              child: Icon(Mdi.genderMale),
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1920),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(decoration: BoxDecoration(
            border: Border.all(color: Colors.white)),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(width:5.0,color:Colors.white)
                ),
                onPressed: () => _selectDate(context),
                child: Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
El layout estará compuesto por un body de una única columna donde dentro habrá 3 containers
que dividen horizontalmente las 3 partes principales de esta ventana, dentro de cada container
se incluirá toddo lo necesario para crearlo como en el mockup
*/
// TODO Poner expanded en lugar de containers en los principales para respetar distintos tamaños
//https://api.flutter.dev/flutter/material/Icons/undo_rounded-constant.html
//https://api.flutter.dev/flutter/material/Icons/close_rounded-constant.html
