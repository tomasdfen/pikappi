import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mdi/mdi.dart';
import 'package:intl/intl.dart';
import '../../DataBase/connection.dart';
import '../../Widgets/ImageButton.dart';
import '../../Models/pokemon.dart';
import '../../Widgets/ScreenSize.dart';
import 'dart:math';
import '../../app.dart';
import '../home/home.dart';

String num_entr = "0";

class UserSettings extends StatefulWidget {
  _UserSettings createState() => _UserSettings();
}

class _UserSettings extends State<UserSettings> {
  Image entrenador1 =
  Image.asset('assets/trainers/' + '0' + '.png');
  Image entrenador2 =
  Image.asset('assets/trainers/' + '1' + '.png');
  Image entrenador3 =
  Image.asset('assets/trainers/' + '2' + '.png');



  @override
  Widget build(BuildContext context) {
    getUser().then((result) {
       num_entr = result['trainer'];
    });

    Image perfil = Image.asset('assets/trainers/'"$num_entr"'.png', fit: BoxFit.contain);

    return Scaffold(
      backgroundColor: HexColor("DAF6FF"),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  flex: 0,
                  child: Container(
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
                  )),
              Expanded(
                flex: 5,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                    padding: EdgeInsets.symmetric(
                        vertical:
                        5.0), //padding interior de las letras con el boxdecoration
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: HexColor("ffffff")),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: FractionallySizedBox(
                            alignment: Alignment.topCenter,
                            widthFactor: 0.5,
                            child: Container(
                              //2 containers para respetar la medida del grande y luego reducirlo al marco de texto para el otro container
                              margin: const EdgeInsets.only(
                                  bottom: 20.0, top: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  color: HexColor("DAF6FF")),
                              child: Container(
                                  child:
                                  Center(child: Text("Nombre Entrenador"))),

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

                                    child:  perfil,
                                  ),),
                              Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
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
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                            5.0),
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
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                            10.0),
                                                        child: Text(
                                                            "Fecha de Nacimiento"),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                    width: 110,
                                                    height: 50,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15)),
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
                                                      padding:
                                                      EdgeInsets.symmetric(
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
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10.0),
                                                      child: Text("Género"),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Container(
                                                          height: 40,
                                                          child: Center(
                                                            child:
                                                            GenderSelector(),
                                                          ))),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.symmetric(
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
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10.0),
                                                      child: Text(
                                                          "Pokémon Favorito"),
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
                                                      padding:
                                                      EdgeInsets.symmetric(
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
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10.0),
                                                      child:
                                                      Text("Experiencia"),
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
                                  )

                              )

                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 4,
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
                          widthFactor: 0.6,
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
                          child: GridView.count(
                              childAspectRatio: 1.0,
                              padding: EdgeInsets.only(left: 5, right: 5),
                              crossAxisCount: 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              children: [
                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        perfil = entrenador1;
                                        num_entr = updateUserTrainer("0") as String;
                                      });
                                    },
                                    child: ClipRRect(
                                      child: Image.asset(
                                          'assets/trainers/' +
                                              '0' +
                                              '.png',fit: BoxFit.contain),
                                    ),
                                  ),
                                ),

                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        perfil = entrenador2;
                                        num_entr = updateUserTrainer("1") as String;
                                      });
                                    },
                                    child: ClipRRect(
                                      child: Image.asset(
                                          'assets/trainers/' +
                                              '1' +
                                              '.png',fit: BoxFit.contain),
                                    ),
                                  ),
                                ),

                                Material(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        perfil = entrenador3;
                                        num_entr = updateUserTrainer("2") as String;
                                      });
                                    },
                                    child: Container(
                                      child: Image.asset(
                                          'assets/trainers/' +
                                              '2' +
                                              '.png',fit: BoxFit.contain),
                                    ),
                                  ),
                                ),


                              ])
                      ),
                    ),

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

String _value = "femenine";

class GenderSelector extends StatefulWidget {
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    getUser().then((result) {
      setState(() {
        _value = result['gender'];
      });
    });

    return Scaffold(
      backgroundColor: HexColor("DAF6FF"),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () { setState(() { _value = updateUserGender("femenine") as String; } );},
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: _value == "femenine" ? Colors.pinkAccent : Colors.transparent,
              ),
              child: Icon(Mdi.genderFemale),
            ),
          ),
          GestureDetector(
            onTap: () { setState(() { _value = updateUserGender("masculine") as String; } );},
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: _value == "masculine" ? Colors.blueAccent : Colors.transparent,
              ),
              child: Icon(Mdi.genderMale),
            ),
          ),
          GestureDetector(
            onTap: () { setState(() { _value = updateUserGender("nonbinary") as String; } );},
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: _value == "nonbinary" ? Colors.brown : Colors.transparent,
              ),
              child: Icon(Mdi.genderNonBinary),
            ),
          ),
        ],
      ),
    );
  }
}

DateTime selectedDate = DateTime.now();

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  @override
  Widget build(BuildContext context) {
    getUser().then((result) {
      setState(() {
        selectedDate = result['birthday'];
      });
    });

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
        updateUserBirthday(picked);
      });
  }


    String formattedDate = DateFormat('dd-MM-yyyy – kk:mm').format(selectedDate);

    return Scaffold(
      body: Container(
        width: 110,
        height: 50,
        
        decoration: BoxDecoration(border: Border.all(color: Colors.white,), borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Flexible(
              flex: 1,
              child: Container(
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(width: 5.0, color: Colors.white)),
                onPressed: () => _selectDate(context),
                child: Text(
                  "$formattedDate".split(' ')[0],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}


class FotoPerfil extends StatefulWidget {
  @override
  _FotoPerfil createState() => _FotoPerfilState();

  Image foto = Image.asset('assets/trainers/' + '0' + '.png', fit: BoxFit.contain);
  SetFoto =

}

class _FotoPerfil {

  Widget build(BuildContext context) {
    getUser().then((result) {
      setState(() {
        selectedDate = result['birthday'];
      });
    });

    return void;

}

class _FotoPerfilState extends State<FotoPerfil> {
  @override
  Widget build(BuildContext context) {
    getUser().then((result) {
      setState(() {
        selectedDate = result['birthday'];
      });
    });

/*
El layout estará compuesto por un body de una única columna donde dentro habrá 3 containers
que dividen horizontalmente las 3 partes principales de esta ventana, dentro de cada container
se incluirá toddo lo necesario para crearlo como en el mockup
*/
// TODO Poner expanded en lugar de containers en los principales para respetar distintos tamaños
//https://api.flutter.dev/flutter/material/Icons/undo_rounded-constant.html
//https://api.flutter.dev/flutter/material/Icons/close_rounded-constant.html