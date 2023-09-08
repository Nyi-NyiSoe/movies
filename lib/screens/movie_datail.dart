import 'package:flutter/material.dart';
import 'package:movies/movie_data/movie_data.dart';

class MovieDetails extends StatelessWidget {
  String imagePath;
  String backgroundImage;
  String title;

  MovieDetails(
      {required this.imagePath,
      required this.backgroundImage,
      required this.title});

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
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(
                        0.5), // Adjust opacity here (0.5 means 50% transparent)
                    BlendMode.dstATop, // Use dstATop to apply transparency
                  ),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2$backgroundImage'))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2$imagePath'),
                  height: 258,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    child: Text(
                      title,
                      maxLines: 3,
                      style: TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white70),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
