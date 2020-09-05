import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListPerson extends StatefulWidget {
  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {

  Database _database;

  //que todo State possui um ciclo de vida, que inicia pelo initState
  //e eu quero acessar o meu banco e ler os dados já salvos no início
  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  //OBS: o flutter só possui como banco de dados relacional nativo, o SQLite
  //assíncrona - que o app não congele
  getDatabase() async {
    openDatabase(
        //sempre o await é usado em conjunto com o async
        //função join concatena os parâmetros
        join(await getDatabasesPath(), 'person_database.db'),
        onCreate: (db, version)
        {
          return db.execute(
            "CREATE TABLE person(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT)",
          );
        },
        version: 1
    ).then((db) {
      setState(() {
        _database = db;
      });

      //readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoas"),
        actions: <Widget>[
          if (_database != null) IconButton(
            icon: Icon(Icons.add),
            onPressed: (){

            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => buildListItem(index),
        separatorBuilder: (context, index) => Divider(
          height: 1,
        ),
      ),
    );
  }

  Widget buildListItem(int index){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: Text("ID"),//${personsList[index].id}"),
          title: Text("Nome"),//personsList[index].firstName),
          subtitle: Text("Sobrenome"),//personsList[index].lastName),
          onLongPress: (){
            //deletePerson(index);
          },
        ),
      ),
    );
  }

}
