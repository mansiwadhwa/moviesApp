class Movies {
  int _id = 0;
  String _title = "";
  String _director = "";
  String _releaseDate = "";
  String _image = "";
  double _rating = 5;

  Movies(this._id, this._title, this._director, this._releaseDate, this._rating,
      this._image);

  int get id => _id;
  String get title => _title;
  String get director => _director;
  String get releaseDate => _releaseDate;
  String get image => _image;
  double get rating => _rating;

  set title(String newtitle) {
    if (newtitle.length <= 255) {
      this._title = newtitle;
    }
  }

  set director(String newdirector) {
    if (newdirector.length <= 255) {
      this._director = newdirector;
    }
  }

  set image(String newimage) {
    if (newimage.length <= 255) {
      this._image = newimage;
    }
  }

  set releaseDate(String newdate) {
    this._releaseDate = newdate;
  }

  set rating(double newrating) {
    if (newrating > 0 && newrating < 10.0) {
      this._rating = newrating;
    }
  }

  //convert movies object to a map
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['director'] = _director;
    map['releaseDate'] = _releaseDate;
    map['image'] = _image;
    map['rating'] = _rating;

    return map;
  }

//reverse to extract Movies object from map
  Movies.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._director = map['director'];
    this._releaseDate = map['releaseDate'];
    this._image = map['image'];
    this._rating = map['rating'];
  }
}
