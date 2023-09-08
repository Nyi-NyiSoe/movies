import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'movie_tile.dart';
import 'movie_data.dart';
import 'package:movies/screens/movie_datail.dart';
class SearchMovieList extends StatelessWidget {
  List<dynamic> movieList;
  bool isLoading;
   SearchMovieList({required this.movieList, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading ? Container(child: SpinKitHourGlass(color: Colors.red),) : Expanded(
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8),
              child: MovieTile(
                imagePath: movieList[index]["poster_path"],
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MovieDetails(
                      backgroundImage: movieList[index]['backdrop_path'],
                      imagePath: movieList[index]["poster_path"],
                      title: movieList[index]['original_title'] ?? '__',
                    );
                  }));
                },
              ));
        },
        itemCount: movieList.length,
      ),
    );
  }
}