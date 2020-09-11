import 'package:floor/floor.dart';
import 'package:flutter_imed_bd/nosql/model/book.dart';

//uma classe abstrata.
//depois, o geredor de código vai criar a classe concreta
@dao
abstract class BookDao {
  @Query('SELECT * FROM Book')
  Future<List<Book>> findAll();

  @insert
  Future<int> insertBook(Book book);

  @delete
  Future<int> deleteBook(Book book);

  //percebam o uso extensivo de annotations

}