import 'package:flutter/material.dart';
import 'package:movies/movie_data/movie_tile.dart';
import 'package:movies/screens/movie_datail.dart';
import 'movie_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieList extends StatefulWidget {
  
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<dynamic>? movieList;
  MovieData movieData = MovieData();
  bool isLoading = true;
 

  @override
  void initState() {
    getMovieList();
    super.initState();
  }

  Future<void> getMovieList() async {
    setState(() {
      isLoading = true;
    });
    dynamic result = await movieData.fetchPopularMovieData();
    setState(() {
      if (result != null) {
        isLoading = false;
        movieList = result["results"];
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: isLoading? Center(child: SpinKitHourGlass(color: Colors.red),) :GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: (1/1.5)),
        itemBuilder: (context, index) {
          String movieId = movieList![index]['id'].toString();
          return Padding(
              padding: const EdgeInsets.all(5),
              child: MovieTile(
                imagePath: movieList![index]["poster_path"],
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MovieDetails(
                      movieId: movieId.toString(),
                     
                    );
                  }));
                },
              ));
        },
        itemCount: movieList?.length ?? 0,
      ),
    );
  }
}
