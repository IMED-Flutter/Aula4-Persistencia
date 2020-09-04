import 'package:flutter/material.dart';

class ListPerson extends StatefulWidget {
  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoas"),
        actions: <Widget>[
          IconButton(
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
