import 'package:flutter/material.dart';
import 'package:flutter_imed_bd/nosql/addBook.dart';
import 'package:flutter_imed_bd/nosql/listBooks.dart';
import 'package:flutter_imed_bd/sqlite/addPerson.dart';
import 'package:flutter_imed_bd/sqlite/listPerson.dart';
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
        '/sqlite': (context) => ListPerson(),
        '/addPerson': (context) => AddPerson(),
        '/nosql': (context) => ListBooks(),
        '/addBook': (context) => AddBook()
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
        buildListItem(context, "SQLite", "Pessoas", "sqlite-icon.svg", "/sqlite"),
        buildListSeparator(),
        buildListItem(context, "Floor", "Livros", "db.svg", "/nosql"),
        buildListSeparator(),
        buildListItem(context, "Firebase", "Carros", "firebase-icon.svg", "/firebase"),
      ],
    ),
  );

  //método para construção dinamica dos itens do ListView
  Widget buildListItem(
      BuildContext context,
      String title,
      String subTitle,
      String pathIcon,
      String nameRoute) => ListTile(
      title: Text(title),
      subtitle: Text("Lista de $subTitle"),
      leading: SvgPicture.asset(
        "images/$pathIcon",
        width: 48,
        height: 48,
      ),
      trailing: Icon(Icons.navigate_next),
      onTap: (){
        Navigator.pushNamed(context, nameRoute);
      },
  );

  Widget buildListSeparator() => Divider(
    height: 1,
    color: Colors.black54,
  );

}
