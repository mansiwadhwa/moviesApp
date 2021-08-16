import 'package:flutter/material.dart';
import 'package:movies_app/Helpers/database_helper.dart';
import 'package:movies_app/Model/movies.dart';

class MovieDetails extends StatefulWidget {
  String appBarTitle;
  final Movies movie;
  MovieDetails(this.movie,this.appBarTitle);

  @override
  _MovieDetailsState createState() => _MovieDetailsState(this.movie, this.appBarTitle);
}

class _MovieDetailsState extends State<MovieDetails> {
  String appBarTitle;
  final Movies movie;
  _MovieDetailsState(this.movie,this.appBarTitle);
  DataBaseHelper Helper = DataBaseHelper();

  @override
  TextEditingController titleController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController releaseDateController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  Widget build(BuildContext context) {

    titleController.text= movie.title;
    directorController.text= movie.director;
    releaseDateController.text= movie.director;
    ratingController.text= movie.director;


    return Scaffold(
      appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
             moveToLastScreen();
            },
          )),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: ListView(
              children: [
                //Add Title
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        labelText: "Movie Title", hintText: "Enter the title"),
                    onChanged: (value) {
                     updateTitle();
                    },
                  ),
                ),

                //Add Director
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: directorController,
                    onChanged: (value) {
                     updateDirector();
                    },
                    decoration: InputDecoration(
                      labelText: "Movie Director",
                    ),
                  ),
                ),

                //Add Rating
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ratingController,
                    onChanged: (value) {
                      updateRating();
                    },
                    decoration: InputDecoration(
                      labelText: "Rating",
                    ),
                  ),
                ),

                //Add ReleaseDate
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: releaseDateController,
                    onChanged: (value) {
                      debugPrint("Changed");
                      //updateReleaseDate();
                    },
                    decoration: InputDecoration(
                      labelText: "releasedate",
                    ),
                  ),
                ),

                //Buttons
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white12),
                          padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                        ),
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Save");
                            _save();
                          });
                        },
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white12),
                          padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                        ),
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Delete presses");
                            _delete();
                          });
                        },
                      ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  //pop function
  void moveToLastScreen(){
    Navigator.pop(context, true);
  }

  //Update fields of table
  void updateTitle(){
    movie.title= titleController.text;
  }
  void updateDirector(){
    movie.director = directorController.text;
  }
  void updateReleaseDate(){
    movie.releaseDate = releaseDateController.text;
  }
  void updateRating(){
    movie.title = titleController.text;
  }

  //save data to table
  void _save() async{
    int result;
   moveToLastScreen();
    if(movie.id!=null){
      result = await Helper.updateMovie(movie);
    }
    else{
      result= await Helper.insertMovie(movie);
    }
    //Successs
    if(result!=0){
      _showDialoge("Status", "Saved Successfully");
    }
    //failure
    else{
      _showDialoge("Status", "Not Saved! ");
    }
  }

  void _delete() async{
    //delete new node
   moveToLastScreen();
    if(movie.id== null){
    _showDialoge('Status', 'No movies saved');
    return;
    }
    int result = await Helper.deleteMovie(movie.id);
    if(result!=0){
      _showDialoge('Status', 'Deleted!');
    }
    else{
      _showDialoge('Status', 'Error occured while Deleting');
    }
  }

  void _showDialoge(String title, String message){
    AlertDialog alertDialoge = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder:(_) => alertDialoge);
  }


}
