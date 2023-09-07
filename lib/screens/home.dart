import 'package:flutter/material.dart';
import 'package:movies/authenticate/auth_service.dart';
import 'package:movies/constants.dart';
import 'package:movies/movie_data/movie_list.dart';
import 'package:movies/movie_data/movie_data.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
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
                decoration: kTextFormDecoration.copyWith(
                    hintText: 'Search',
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.search))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Text(
                  'Popular this week',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(child: MovieList())
          ],
        ),
      ),
    );
  }
}
