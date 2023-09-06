import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/authenticate/auth_service.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/models/user.dart';
import 'package:movies/wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_,__){},
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
              buttonTheme: const ButtonThemeData(buttonColor: Colors.red)),
          home: const Wrapper()
          
          ),
    );
  }
}
