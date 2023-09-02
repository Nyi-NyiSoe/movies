import 'package:flutter/material.dart';
import 'package:movies/authenticate/auth_service.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          ElevatedButton.icon(onPressed: ()async{
           await _auth.signOut();
          }, icon: Icon(Icons.person), label: Text('Logout'),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),)
        ],
      ),
      body: Container(),
    ),
    );
  }
}
