import 'package:flutter/material.dart';
import 'package:movies/movie_data/movie_tile.dart';
import 'movie_data.dart' as temp;

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      
      return Container(
        height: 150,
        width: 100,
        child: MovieTile(title: temp.titles[index],));
    },
    itemCount: temp.titles.length,
    );
  }
}