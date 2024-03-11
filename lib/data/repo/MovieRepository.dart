import 'package:movies_app/data/entity/moviesModel.dart';
import 'package:movies_app/sqliteBuilder/DatabaseBuilder.dart';

class MovieDaoRepository{


  Future<List<Movies>> loadMovies() async {
    var db = await DataBaseBuilder.veritabaniErisim();
    List<Map<String,dynamic>> mapDBRows = await db.rawQuery("select * from movies");

    return List.generate(mapDBRows.length, (index){ // kaç adet film rowu varsa db de o kadar çalışacak.
      var row = mapDBRows[index];
      return Movies(id: row["m_id"], movieName: row["m_name"], movieImage:row["m_image"], price: row["m_price"]);
    });

  }




}