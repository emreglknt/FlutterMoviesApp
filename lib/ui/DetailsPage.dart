import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/entity/moviesModel.dart';

class DetailsPage extends StatefulWidget {

  Movies movie;
  DetailsPage({required this.movie});


  @override
  State<DetailsPage> createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.movieName),),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 450,
          child: Card(
            elevation: 8.0,
            color: Colors.black54,
            margin: const EdgeInsets.all(3.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("images/${widget.movie.movieImage}"),
                Text('${widget.movie.price} TL',style: TextStyle(color: Colors.white,fontSize: 30,),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
