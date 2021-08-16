import 'package:flutter/material.dart';
import 'package:movies_app/Helpers/database_helper.dart';
import 'package:movies_app/Model/movies.dart';
import 'package:movies_app/Screens/add_movie.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  DataBaseHelper databaseHelper = DataBaseHelper();
  late List<Movies> moviesList ;
  int count = 0;


  @override
  Widget build(BuildContext context) {
    if (moviesList == null) {
      moviesList =[];
      updateListView();
    }

    // function to add pictures;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: getMoviesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          debugPrint("FAB clicked");
          bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MovieDetails(Movies(0,'','','',1,''), "Add Details");
          }));
          if (result== true){
            updateListView();
          }
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getMoviesList() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_left_rounded),
            ),
            title: Text(
              "dummy title",
            ),
            subtitle: Text("Dummy Date"),
            trailing: GestureDetector(
              onTap: () {
                _delete(context, moviesList[position]);
              },
              child: Icon(
                Icons.delete,
                color: Colors.white10,
              ),
            ),
            onTap: () async{
              debugPrint("ListTile tapped");
              bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MovieDetails( this.moviesList[position],"Edit Details");
              }));
              if (result== true){
                updateListView();
              }
            },
          ),
        );
      },
    );
  }



  void _delete(BuildContext context, Movies movie) async {
    int result = await databaseHelper.deleteMovie(movie.id);
    if (result != null) {
      _showSnackBar(context, "Deleted!");
      updateListView();
    }
  }
  void updateListView() async{
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Movies>> movieListFuture= databaseHelper.getMoviesList();
      movieListFuture.then((moviesList){
        setState(() {
          this.moviesList= moviesList;
          this.count= moviesList.length;
        });
      });
    });
  }
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }




}
