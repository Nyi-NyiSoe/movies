import 'package:flutter/material.dart';
import 'package:movies/movie_data/movie_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
                            Colors.black.withOpacity(
                                0.5), // Adjust opacity here (0.5 means 50% transparent)
                            BlendMode
                                .dstATop, // Use dstATop to apply transparency
                          ),
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movieDetails['backdrop_path']}'))),
                  child: Column(
                    children: [
                      Expanded(
                          child: Image(
                        image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movieDetails['poster_path']}',
                        ),
                        height: 258,
                      )),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        movieDetails['title'] ?? 'no data',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        Text(movieDetails['genres']
                                            .map((genre) => genre['name'])
                                            .join(', ')),

                                        // Text(movieDetails['runtime'].toString()+'mins'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                          '${movieDetails['runtime']} mins'),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     const Padding(
                                      padding:  EdgeInsets.all(10.0),
                                      child: Text(
                                        'Overview',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(movieDetails['overview']),
                                    )

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
