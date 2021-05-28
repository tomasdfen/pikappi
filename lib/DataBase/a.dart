import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spinnig Menu",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: new Scaffold(
        body: new SafeArea(
          child: new Column(
            children: <Widget>[new CustomThemedRadialMenu()],
          ),
        ),
      ),
    );
  }
}

class CustomThemedRadialMenu extends StatefulWidget {

  @override
  _CustomThemedRadialMenuState createState() => _CustomThemedRadialMenuState();
}

class _CustomThemedRadialMenuState extends State<CustomThemedRadialMenu> with SingleTickerProviderStateMixin {
  Animation animationOpenClose;
  AnimationController animationControllerOpenClose;

  bool isOpen;

  @override
  void initState() {
    isOpen = false;
    animationControllerOpenClose = AnimationController(duration: new Duration(seconds: 5), vsync: this);
    animationOpenClose = Tween(begin: 0.0, end: 3.14159 * 2).animate(animationControllerOpenClose);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///A list of the items and the center menu button
    final List<Widget> menuContents = <Widget>[];

    ///Menu Close/Open button
    menuContents.add(new InkWell(
      onTap: () {
        if (isOpen) {
          closeMenu();
        } else {
          openMenu();
        }
      },
      child: Container(
          padding: new EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(color: Colors.black38),
            shape: BoxShape.circle,
          ),
          child: new AnimatedBuilder(
            animation: animationControllerOpenClose,
            builder: (context, child) {
              return new Transform.rotate(angle: animationOpenClose.value, child: child);
            },
            child: isOpen ? new Icon(Icons.clear) : new Icon(Icons.menu),
          )),
    ));

    return new Stack(
      alignment: Alignment.center,
      children: menuContents,
    );
  }

  @override
  void dispose() {
    animationControllerOpenClose.dispose();

    super.dispose();
  }

  closeMenu() {
    animationControllerOpenClose.forward(from: 0.0);
    setState(() {
      isOpen = false;
    });

    print("RadialMenu Closed");
  }

  openMenu() {
    animationControllerOpenClose.forward(from: 0.0);
    setState(() {
      isOpen = true;
    });

    print("RadialMenu Opened");
  }
}