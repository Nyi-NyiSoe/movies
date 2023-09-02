import 'package:flutter/material.dart';
import 'package:movies/constants.dart';

class RegisterPage extends StatefulWidget {
  
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final _formKey = GlobalKey<FormState>();

  final emaliController = TextEditingController();

  final passwordContoller = TextEditingController();

  String email = '';

  String password = '';
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.person),
                  Text(
                    'LogIn',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
        body: Container(
          //decoration: BoxDecoration(image:DecorationImage(image: AssetImage('images/background.png'))),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 130,
                    child: Icon(Icons.person,size: 100,color: Colors.red,)
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) => value?.isEmpty ?? true
                                    ? 'Enter email'
                                    : null,
                                controller: emaliController,
                                decoration: kTextFormDecoration.copyWith(
                                  hintText: 'Email'
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                obscureText: true,
                                validator: (value) => (value?.length ?? 0) < 6
                                    ? "Enter a password with more than 6 characters"
                                    : null,
                                controller: passwordContoller,
                                decoration: kTextFormDecoration.copyWith(
                                  hintText: 'Password'
                                ),
                                
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                width: 150,
                                child: ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red)),
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      print(email);
                                      print(password);
                                    }
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

