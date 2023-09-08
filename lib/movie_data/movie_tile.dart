import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  //String title;
  Function() onTap;
  String imagePath;
  MovieTile({super.key, required this.onTap, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2$imagePath'),
      ),
      onTap: onTap,
    );
  }
}
