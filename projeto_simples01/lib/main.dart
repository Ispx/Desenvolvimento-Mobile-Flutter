import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RotaWidget());
  }
}

class RotaWidget extends StatefulWidget {
  RotaWidget({Key key}) : super(key: key);

  StateWidget createState() => StateWidget();
}

class StateWidget extends State<RotaWidget> {
  Widget build(BuildContext context) {
    final RichText titleLogin = RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: "Bem vindo\n",
              style: TextStyle(color: Colors.white, fontSize: 35)),
          TextSpan(
              text: "ao ", style: TextStyle(color: Colors.white, fontSize: 35)),
          TextSpan(
              text: "App ;)\n",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ))
        ]));

    final emailLogin = TextField(
        obscureText: false,
        maxLines: 1,
        decoration: InputDecoration(
            hintText: "Email",
            hintStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            contentPadding: EdgeInsets.fromLTRB(10, 25, 0, 25),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(color: Colors.white))));

    final passwordLogin = TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Senha",
            hintStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            contentPadding: EdgeInsets.fromLTRB(10, 25, 0, 25),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32))));

    final bottonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: RaisedButton(
        color: Colors.red,
        child: Text(
          "Entrar",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        onPressed: () => {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
            title: Text("Login",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    decorationColor: Colors.indigoAccent)),
            backgroundColor: Colors.orangeAccent),
        body: Container(
          margin: const EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueAccent),
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 80),
                  child: titleLogin,
                ),
              ),
              SizedBox(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 100, bottom: 0, right: 10, left: 10),
                  child: emailLogin,
                ),
              ),
              SizedBox(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 15, bottom: 0, right: 10, left: 10),
                  child: passwordLogin,
                ),
              ),
              SizedBox(
                child: Container(
                  margin: EdgeInsets.only(top: 25, left: 40, right: 40),
                  child: bottonLogin,
                ),
              )
            ],
          ),
        ));
  }
}
