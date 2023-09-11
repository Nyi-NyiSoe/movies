import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/movie_data/movie_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetails extends StatefulWidget {
  final String movieId;

  MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final MovieData movieData = MovieData();
  late Map<String, dynamic> movieDetails = {};
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    getMovieDetail(widget.movieId);
  }

  void getMovieDetail(String movieId) async {
    setState(() {
      isLoading = true;
    });
    dynamic result = await movieData.fetchMovieDetail(movieId);
    setState(() {
      movieDetails = result;
     print(movieDetails['videos']);
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movie Details'),
        ),
        body: isLoading
            ? SpinKitHourGlass(color: Colors.red)
            : Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.dstATop,
                    ),
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movieDetails['backdrop_path']}',
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movieDetails['poster_path']}',
                        ),
                        height: 258,
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieDetails['title'] ?? 'no data',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(movieDetails['release_date']),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 6,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                movieDetails['genres']
                                    .map((genre) => genre['name'])
                                    .join(', '),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('${movieDetails['runtime']} mins'),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Overview',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(movieDetails['overview']),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text('Watch trailer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                // Padding(padding: const EdgeInsets.all(8)
                                // child: YoutubePlayerBuilder(player: YoutubePlayer(controller: YoutubePlayerController(initialVideoId: movieDetails[''])), builder: builder),)
                              //Text(movieDetails['videos'][0]['key'])
                              ],
                            ),
                          )
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
