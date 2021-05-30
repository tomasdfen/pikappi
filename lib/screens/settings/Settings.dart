/*import 'dart:html';

import 'package:flutter/material.dart';
import '../../app.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:cupertino_setting_control/cupertino_setting_control.dart';

class Settings extends StatelessWidget {
  final bool finger = true;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: 'Section',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.switchTile(
              title: 'Use fingerprint',
              leading: Icon(Icons.fingerprint),
              switchValue: finger,
              onToggle: (bool value) {value= false;},
            ),
          ],
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'utils/git_assets.dart';
import 'utils/inlanding.dart';
*/
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Widgets/utils/git_assets.dart';
import '../../app.dart';
import '../../DataBase/connection.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Settings extends StatefulWidget {
  _Settings createState() => _Settings();
}

String usuario = 'aa';
String num_entr = '0';

class _Settings extends State<Settings> {
  static final String path = "lib/screens/settings/Settings.dart";
  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
  //TODO maximo de tamaño del nombre

  String foto = 'assets/trainers/trainer_1.png';

  final assetsAudioPlayer = AssetsAudioPlayer();

  _onLocationTap(BuildContext context) {
    Navigator.pushNamed(context, LocationsRoute);
  }

  bool _play = false;
  @override
  Widget build(BuildContext context) {
    getUser().then((result) {
      print(">> Actualizando datos en ajustes");
      setState(() {
        usuario = result['name'];
        foto = 'assets/trainers/trainer_{$result["trainer"]}.png';
      });
    });

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Container(
                height: 80,
                child: Card(
                  elevation: 0.5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: FotoPerfil(),
                        title: Align(
                          child: Text(
                            usuario,
                            style: TextStyle(fontSize: 20),
                          ),
                          alignment: Alignment(0, 0),
                        ),
                        onTap: () => _onLocationTap(context),
                      )
                    ],
                  ),
                )),
            const SizedBox(height: 20.0),
            Text(
              "Ajustes del Sistema",
              style: headerStyle,
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: _play,
                    title: Text("Activar música"),
                    onChanged: (bool value) {
                      if (value == true) {
                        assetsAudioPlayer.open(
                          Audio("assets/audios/background.mp3"),
                          showNotification: true,
                        );
                      } else {
                        assetsAudioPlayer.pause();
                      }
                      setState(() {
                        _play = value;
                      });
                    },
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: false,
                    title: Text("Received newsletter"),
                    onChanged: null,
                  ),
                  _buildDivider(),
                  Notificaciones(),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: Colors.purple,
                    value: true,
                    title: Text("Received App Updates"),
                    onChanged: null,
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}

class FotoPerfil extends StatefulWidget {
  _FotoPerfil createState() => _FotoPerfil();
}

class _FotoPerfil extends State<FotoPerfil> {
  @override
  Widget build(BuildContext context) {
    getUser().then((result) {
      num_entr = result['trainer'];
    });

    return CircleAvatar(
      radius: 35,
      child:
          ClipOval(child: Image.asset('assets/trainers/' + num_entr + '.png')),
    );
  }
}

class Notificaciones extends StatefulWidget {
  @override
  _NotificacionesState createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool _notificaciones = false;
  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Recibir notificaciones"),
      activeColor: Colors.purple,
      value: _notificaciones,
      onChanged: (bool value) {
        if (value == true) {
          showNotification();
          showNotificationPerTime();
        } else {}
        setState(() {
          _notificaciones = value;
        });
      },
    );
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'PikAppi', 'Notificaciones activadas', platform,
        payload: 'AndroidCoding.in');
  }

  showNotificationPerTime() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('repeating channel id',
            'repeating channel name', 'repeating description');

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'PikAppi',
        'Ven a capturar Pokémons!',
        RepeatInterval.daily,
        platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }
}
