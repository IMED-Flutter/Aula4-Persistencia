import 'package:floor/floor.dart';
import 'package:flutter_imed_bd/nosql/dao/daoBook.dart';
import 'package:flutter_imed_bd/nosql/model/book.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'dart:async';

part 'appDatabase.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}