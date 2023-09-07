import 'package:flutter/material.dart';
import 'package:movies/movie_data/movie_tile.dart';
import 'package:movies/screens/movie_datail.dart';
import 'movie_data.dart';

class MovieList extends StatefulWidget {
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<dynamic>? movieList;
  MovieData movieData = MovieData();

  @override
  void initState() {
    getMovieList();
  }

  Future<void> getMovieList() async {
    dynamic result = await movieData.fetchMovieData();
    setState(() {
      if (result != null) {
        movieList = result["results"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.all(8),
                child: MovieTile(
                  imagePath: movieList![index]["poster_path"],
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MovieDetails(
                        imagePath: movieList![index]["poster_path"],
                      );
                    }));
                  },
                ));
          },
          itemCount: movieList?.length ?? 0,
        ),
      ),
    );
  }
}
