
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/entity/moviesModel.dart';
import 'package:movies_app/data/repo/MovieRepository.dart';

class HomePageCubit extends  Cubit<List<Movies>>{

  HomePageCubit():super(<Movies>[]);

  var mRepo = MovieDaoRepository();

  Future<void> loadMovies() async {
    var mList = await mRepo.loadMovies();
    emit(mList);// repodan gelen movie türündeki listeyi arayüz sınıfına gönderir.
  }



}