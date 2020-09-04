import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      //rotas nomeadas
      //estamos dizendo que a rota inicial (initialRoute) tem o nome /
      initialRoute: '/',
      //defino as rotas possíveis dentro da aplicação
      routes: {
        '/': (context) => Home(),
        //'/sqlite': (context) => ListPersons()
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Flutter - Persistência"),
    ),
    body: ListView(
      children: <Widget>[
        ListTile(
          title: Text("SQLite"),
          subtitle: Text("Lista de Pessoas"),
          leading: SvgPicture.asset(
            "images/sqlite-icon.svg",
            width: 48,
            height: 48,
          ),
          trailing: Icon(Icons.navigate_next),
          onTap: (){
            Navigator.pushNamed(context, "/sqlite");
          },
        ),
        Divider(
          height: 1,
          color: Colors.black54,
        ),
        ListTile(
          title: Text("Floor"),
          subtitle: Text("Lista de Livros"),
          leading: SvgPicture.asset(
            "images/db.svg",
            width: 48,
            height: 48,
          ),
          trailing: Icon(Icons.navigate_next),
          onTap: (){
            Navigator.pushNamed(context, "/nosql");
          },
        ),
        Divider(
          height: 1,
          color: Colors.black54,
        ),
        ListTile(
          title: Text("Firebase"),
          subtitle: Text("Lista de Carros"),
          leading: SvgPicture.asset(
            "images/firebase-icon.svg",
            width: 48,
            height: 48,
          ),
          trailing: Icon(Icons.navigate_next),
          onTap: (){
            Navigator.pushNamed(context, "/firebase");
          },
        ),
      ],
    ),
  );
}
