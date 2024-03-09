import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/entity/moviesModel.dart';
import 'package:movies_app/ui/cubits/HomePageCubit.dart';
import 'package:movies_app/ui/view/DetailsPage.dart';

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


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomePageCubit>().loadMovies();//sayfa açıldığı anda cubitteki filmleri yükle fonksiyonu çalıştır.
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),),
      body: BlocBuilder<HomePageCubit,List<Movies>>(//emit ile gelen veriyi dinledik.
        builder: (context,movieList){
          if(movieList.isNotEmpty){
            return GridView.builder(
              itemCount: movieList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.8),
              itemBuilder: (context,index){
                var movie = movieList[index];
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
