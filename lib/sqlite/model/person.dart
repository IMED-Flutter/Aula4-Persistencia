class Person {
  int id;
  final String firstName;
  final String lastName;

  //opcionais {}
  Person({this.id, this.firstName, this.lastName});

  //transforma a instância em um Map, porque o sqlite trabalha com esse
  //formato nas funções de CRUD
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}