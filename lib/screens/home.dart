import 'package:flutter/material.dart';
import 'package:movies/authenticate/auth_service.dart';
import 'package:movies/constants.dart';
import 'package:movies/movie_data/movie_list.dart';
import 'package:movies/movie_data/movie_data.dart';
import 'package:movies/movie_data/search_movie.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String showText = 'Popular this week';
  TextEditingController controller = TextEditingController();
  late List<dynamic> searchResult = [];
  bool isLoading = true;

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
                            dynamic temp =
                                await movieData.fetchMovieData(controller.text);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Text(
                  showText,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
                child: controller.text.isEmpty
                    ? MovieList()
                    : isLoading
                        ? SearchMovieList(
                            movieList: searchResult,
                            isLoading: true,
                          )
                        : SearchMovieList(movieList: searchResult))
          ],
        ),
      ),
    );
  }
}
