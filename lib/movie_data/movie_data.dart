import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieData {
  Future fetchMovieData(String movieName, String page) async {
    movieName = movieName.replaceAll(' ', '%20');
    final url = Uri.parse(
        "https://api.themoviedb.org/3/search/movie?query=$movieName&include_adult=false&language=en-US&page=$page");
    final headers = {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MGY4N2NmODI2M2QyOThhZTY1YThhYzYzMGZhNTlhZCIsInN1YiI6IjY0ZjFlYzhkOTdhNGU2MDBhYzNlZTllNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RzLEl3NB8WdMdHe8hegxAMKmPp29F6DoKueUjRwYA3w"
    };
    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        return decodeData;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchPopularMovieData(String page) async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?language=en-US&page=$page");
    final headers = {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MGY4N2NmODI2M2QyOThhZTY1YThhYzYzMGZhNTlhZCIsInN1YiI6IjY0ZjFlYzhkOTdhNGU2MDBhYzNlZTllNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RzLEl3NB8WdMdHe8hegxAMKmPp29F6DoKueUjRwYA3w"
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        return decodeData;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchMovieDetail(String movieId) async {
    final url =
        Uri.parse("https://api.themoviedb.org/3/movie/$movieId?language=en-US");
    final headers = {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MGY4N2NmODI2M2QyOThhZTY1YThhYzYzMGZhNTlhZCIsInN1YiI6IjY0ZjFlYzhkOTdhNGU2MDBhYzNlZTllNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RzLEl3NB8WdMdHe8hegxAMKmPp29F6DoKueUjRwYA3w"
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        return decodeData;
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future fetchVideoDetail(String movieId) async {
    final url =
        Uri.parse("https://api.themoviedb.org/3/movie/$movieId/videos?language=en-US");
    final headers = {
      "accept": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MGY4N2NmODI2M2QyOThhZTY1YThhYzYzMGZhNTlhZCIsInN1YiI6IjY0ZjFlYzhkOTdhNGU2MDBhYzNlZTllNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RzLEl3NB8WdMdHe8hegxAMKmPp29F6DoKueUjRwYA3w"
    };

    try {
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var decodeData = jsonDecode(response.body);
        return decodeData;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}



