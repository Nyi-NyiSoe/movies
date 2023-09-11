import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movies/authenticate/auth_service.dart';
import 'package:movies/constants.dart';

import 'package:movies/movie_data/movie_data.dart';
import 'package:movies/movie_data/search_movie.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MovieData movieData = MovieData();
  String showText = 'Popular this week';
  TextEditingController controller = TextEditingController();
  late List<dynamic> searchResult = [];
  bool isLoading = true;
  int page = 1;
  late List<dynamic> movieList = [];
  @override
  void initState() {
    getMovieList();
    super.initState();
  }

  Future<void> getMovieList() async {
    setState(() {
      isLoading = true;
    });
    dynamic result = await movieData.fetchPopularMovieData((page).toString());
    setState(() {
      if (result != null) {
        isLoading = false;
        movieList = result["results"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    MovieData movieData = MovieData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.person),
              label: const Text('Logout'),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller,
                decoration: kTextFormDecoration.copyWith(
                    hintText: 'Search',
                    suffixIcon: IconButton(
                        onPressed: () async {
                          if (controller.text.isNotEmpty) {
                            setState(() {
                              showText = 'Results';
                              isLoading = true;
                            });
                            dynamic temp = await movieData.fetchMovieData(
                                controller.text, page.toString());
                            setState(() {
                              isLoading = false;
                              searchResult = temp["results"];
                            });
                          }
                        },
                        icon: Icon(Icons.search))),
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      showText = 'Popular this week';
                    });
                  }
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          page = 1;
                        });

                        popularPaging();
                      },
                      child: Text(
                        showText,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          if (page > 1) {
                            setState(() {
                              isLoading = !isLoading;
                              page = page - 1;
                            });
                          }
                          dynamic temp = await movieData.fetchMovieData(
                              controller.text, page.toString());

                          setState(() {
                            searchResult = temp['results'];
                          });
                          popularPaging();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Previous page ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = !isLoading;
                            page = page + 1;
                          });
                          dynamic temp = await movieData.fetchMovieData(
                              controller.text, page.toString());

                          setState(() {
                            searchResult = temp['results'];
                            //isLoading = !isLoading;
                          });

                          popularPaging();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Next page ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                child: controller.text.isEmpty
                    ? isLoading
                        ? SpinKitHourGlass(color: Colors.red)
                        : SearchMovieList(movieList: movieList)
                    : isLoading
                        ? SearchMovieList(
                            movieList: searchResult,
                            isLoading: true,
                          )
                        : SearchMovieList(movieList: searchResult)),
          ],
        ),
      ),
    );
  }

  void popularPaging() async {
    dynamic result = await movieData.fetchPopularMovieData((page).toString());
    return setState(() {
      if (result != null) {
        movieList = result["results"];
        isLoading = false;
      }
    });
  }
}
