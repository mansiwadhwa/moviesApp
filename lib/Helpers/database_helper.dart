import 'package:flutter/material.dart';
import 'package:movies_app/Model/movies.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  static DataBaseHelper _DBhelper = DataBaseHelper._init(); //Singleton DatabaseHelper //initalaized only once throughout lifecycle of app
  static Database? _database;

  String moviesDB = 'movies_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDirector = 'director';
  String colDate = 'releaseDate';
  String colImage = 'image';
  String colRating = 'rating';

  DataBaseHelper._init(); //constructor

  factory DataBaseHelper() {
    // if(_DBhelper == null){
    //   _DBhelper = DataBaseHelper._init(); //object initaliztion
    // }
    return _DBhelper;
  }

//getter for database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database =
        await initializeDatabase(); //creating single instance of databse when this getter is callled
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    //directory path to store db
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'moviesApp.db';

    //Open /crete the db at given path
    var moviesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return moviesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $moviesDB($colId INTEGER PRIMARY KEY AUTOINCREMENT , $colTitle TEXT, '
        '$colDirector TEXT , $colDate TEXT, $colRating DOUBLE, $colImage IMAGE)');
  }

  //FETCH movie object into table
  Future<List<Map<String,dynamic>>> getMoviesMapList() async{
    Database db = await this. database;

    var result = await db.rawQuery('SELECT * FROM $moviesDB order by $colDate DESC');
    //var result = await db.query(moviesDB, orderBy: '$colDate DESC');
    return result;
  }

  //INSERT movie object into table
  Future<int> insertMovie(Movies movie) async{
   Database db = await this.database;
   var result = await db.insert(moviesDB, movie.toMap());
   return result;
  }

  //UPDATE movie object
  Future<int> updateMovie(Movies movie) async{
    Database db = await this.database;
    var result = await db.update(moviesDB, movie.toMap(), where: 'colId= ?', whereArgs:[movie.id]);
    return result;
  }
  //DELETE movie object from table
  Future<int> deleteMovie(int id) async{
    Database db = await this.database;
    var result = await db.delete(moviesDB, where: 'colId= $id');
    //var result=await db.rawDelete('DELETE FROM $moviesDB where $colId = $id');
    return result;
  }

  //GET NUMBER of movie object from the table
  Future<int?> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x= await db.rawQuery('SELECT COUNT(*) FROM $moviesDB');
    var result = Sqflite.firstIntValue(x);
    return result;
  }

  //Convert Map List fetched above into 'Movies list ' object
  Future <List<Movies>> getMoviesList() async {
    var moviesMapList = await getMoviesMapList();
    int count = moviesMapList.length;

    List<Movies> moviesList= [] ;
    for(int i=0;i<count;i++){
      moviesList.add(Movies.fromMapObject(moviesMapList[i]));
  }
    return moviesList;
}

  Future closeDB() async{
    Database db = await this.database;
    db.close();
  }
}
