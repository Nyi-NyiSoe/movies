import 'package:flutter/material.dart';
import 'package:movies/authenticate/authenticate.dart';
import 'package:movies/authenticate/login_page.dart';
import 'package:movies/authenticate/register_page.dart';
import 'package:movies/models/user.dart';
import 'package:movies/screens/home.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context,listen: false);
   if(user == null){
    return Authenticate();
   }else{
    return Home();
   }
}}