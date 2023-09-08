import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'movie_tile.dart';

import 'package:movies/screens/movie_datail.dart';

class SearchMovieList extends StatelessWidget {
  final List<dynamic> movieList;
  final bool isLoading;
  const SearchMovieList({super.key, required this.movieList, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SpinKitHourGlass(color: Colors.red)
        : Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1 / 1.5),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: MovieTile(
                      imagePath: movieList[index]["poster_path"],
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MovieDetails(
                            movieId: (movieList[index]['id']).toString(),
                            
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
