import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  String title;
  MovieTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: SingleChildScrollView(
        
        child: Column(children: [
          Image(
            fit: BoxFit.cover,
            image:  AssetImage('images/op.jpg'),
            width: 150,
            height: 200,
          ),
          Text(title)
        ]),
      ),
    );
  }
}
