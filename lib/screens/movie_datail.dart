import 'package:flutter/material.dart';
import 'package:movies/movie_data/movie_data.dart';

class MovieDetails extends StatelessWidget {
  String imagePath;

  MovieDetails({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    MovieData movieData = MovieData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movie Details'),
        ),
        body: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8pjWz2lt29KyVGoq1mXYu6Br7dE.jpg'))),
          child: Column(
            children: [
              Image(
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2$imagePath'),
                height: 300,
                fit: BoxFit.cover,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
