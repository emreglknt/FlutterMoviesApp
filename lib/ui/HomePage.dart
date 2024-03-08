import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/entity/moviesModel.dart';
import 'package:movies_app/ui/DetailsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void addToCart(BuildContext context, Movies movie) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Sepete Ekle"),
        content: Text("${movie.movieName} ürününü sepete eklemek istiyor musunuz?"),
        actions: <Widget>[
          TextButton(
            child: Text("Hayır"),
            onPressed: () {
              Navigator.of(context).pop(); // Dialog'u kapat
            },
          ),
          TextButton(
            child: Text("Evet"),
            onPressed: () {
              // Sepete ekleme işlemi burada gerçekleştirilebilir
              Navigator.of(context).pop(); // Dialog'u kapat
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${movie.movieName} sepete eklendi!"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}






class _HomePageState extends State<HomePage> {

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



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),),
      body: FutureBuilder<List<Movies>>(
        future: loadMovies(),
        builder: (context,snapshot){
          if(snapshot.hasData && snapshot.data != null){
            var mList = snapshot.data;
            return GridView.builder(
              itemCount: mList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.8),
              itemBuilder: (context,index){
                var movie = mList![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(movie: movie,)))
                        .then((value) {
                      print("Returned to home page");
                    });
                  },
                  child: Card(
                    color: Colors.black54,
                    elevation: 5.0,
                    margin: const EdgeInsets.all(7.0),
                    child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Image.asset('images/${movie.movieImage}'),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${movie.price} TL',style:const TextStyle(color: Colors.white,fontSize: 20),),
                            IconButton(
                              icon: Icon(Icons.add_shopping_cart,color:Colors.amber,),
                              onPressed: () => addToCart(context, movie),
                            ),
                          ],
                        )

                      ],

                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),

    );
  }
}
