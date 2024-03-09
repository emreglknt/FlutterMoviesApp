import 'package:movies_app/data/entity/moviesModel.dart';

class MovieDaoRepository{


  Future<List<Movies>> loadMovies() async {
    var movieList = <Movies>[];
    var m1 = Movies(id: 1, movieName: "Django", movieImage: "django.png", price: 43);
    movieList.add(m1);
    var m2 = Movies(id: 2, movieName: "Interstellar", movieImage: "interstellar.png", price: 25);
    movieList.add(m2);
    var m3 = Movies(id: 3, movieName: "Inception", movieImage: "inception.png", price: 40);
    movieList.add(m3);
    var m4 = Movies(id: 4, movieName: "The Hateful Eight", movieImage: "thehatefuleight.png", price: 20);
    movieList.add(m4);
    var m5 = Movies(id: 5, movieName: "The Pianist", movieImage: "thepianist.png", price: 80);
    movieList.add(m5);
    var m6 = Movies(id: 6, movieName:"Anadoluda", movieImage: "anadoluda.png", price: 18);
    movieList.add(m6);

    return movieList;

  }




}