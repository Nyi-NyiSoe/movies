import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class MovieTile extends StatefulWidget {
  //String title;
  final Function() onTap;
  final String imagePath;

  const MovieTile({super.key, required this.onTap, required this.imagePath});

  @override
  State<MovieTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    return GestureDetector(
      
      onTap: widget.onTap,
      child: Stack(
        children: [
          Image(
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${widget.imagePath}'),
              loadingBuilder: (context, child, loadingProgress){
                if(loadingProgress == null){
                  isLoading = false;
                }else if(loadingProgress.expectedTotalBytes != null){
                  isLoading = true;
                }
                return isLoading ?
                Center(child: SpinKitHourGlass(color: Colors.red),) : child;
              },
        ),
        
        
        ],
      ),
    );
  }
}
