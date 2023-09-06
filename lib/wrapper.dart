import 'package:flutter/material.dart';
import 'package:movies/authenticate/authenticate.dart';
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
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
