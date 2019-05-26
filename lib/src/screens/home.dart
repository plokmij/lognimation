import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController loginController;
  Animation buttonShrink;

  void initState() {
    super.initState();
    loginController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    buttonShrink = Tween(
      begin: 320.0,
      end: 70.0,
    ).animate(
      CurvedAnimation(
        parent: loginController,
        curve: Curves.linear,
      ),
    );
    //loginController.forward();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: buildButton(),
        ),
      ),
    );
  }

  Widget buildButton() {
    return InkWell(
      onTap: () {
        if (loginController.status == AnimationStatus.completed) {
          loginController.reverse();
        } else if (loginController.status == AnimationStatus.dismissed) {
          loginController.forward();
        }
      },
      child: new AnimatedBuilder(
        animation: buttonShrink,
        //child: ,
        builder: (context, child) {
          return Container(
            width: buttonShrink.value,
            height: 60.0,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
              color: const Color.fromRGBO(247, 64, 106, 1.0),
              borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
            ),
            child: buttonShrink.value > 80
                ? Text(
                    "Hello",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3,
                    ),
                  )
                : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
