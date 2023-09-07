import 'package:http/http.dart' as http;
import 'dart:convert';

const titles = ['a','b','c','d','e','f','g','h'];

class MovieData{
  Future fetchMovieData() async {
    final url = Uri.parse("https://api.themoviedb.org/3/movie/popular?language=en-US&page=1");
    final headers = {
    "accept": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MGY4N2NmODI2M2QyOThhZTY1YThhYzYzMGZhNTlhZCIsInN1YiI6IjY0ZjFlYzhkOTdhNGU2MDBhYzNlZTllNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RzLEl3NB8WdMdHe8hegxAMKmPp29F6DoKueUjRwYA3w"
  };
   
   try{
    http.Response response = await http.get(url,headers: headers);
    if(response.statusCode == 200){
      var decodeData = jsonDecode(response.body);
      return decodeData; 
    }
   }
   catch (e){
    print(e.toString());
   }
   
  }
}