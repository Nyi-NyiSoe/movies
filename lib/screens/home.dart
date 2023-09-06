import 'package:flutter/material.dart';
import 'package:movies/authenticate/auth_service.dart';
import 'package:movies/constants.dart';
import 'package:movies/movie_data/move_list.dart';
import 'package:movies/movie_data/movie_tile.dart';
import 'package:movies/movie_data/movie_data.dart' as temp;
class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    return SafeArea(
        child: Scaffold(
          
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          ElevatedButton.icon(onPressed: ()async{
           await _auth.signOut();
          }, icon: const Icon(Icons.person), label: const Text('Logout'),style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),)
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
               suffixIcon: IconButton(onPressed: (){

               }, icon: Icon(Icons.search))
              
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
              ),
              
              padding: EdgeInsets.all(8),
              child: Text('Popular this week',style: TextStyle(color: Colors.white),),
            ),
          ),
         Expanded(
           child: Container(
            height: 150,
             child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
              return Padding(
                  padding: EdgeInsets.all(10),
                child: MovieTile(title: temp.titles[index]));
             },
             itemCount: temp.titles.length,
             )
           ),
         ),
         
        ],
      ),
    ),
    );
  }
}
