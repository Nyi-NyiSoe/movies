import 'package:flutter/material.dart';
import 'package:movies/constants.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  void Function() toggleView;

  LoginPage({super.key, required this.toggleView});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  final emaliController = TextEditingController();

  final passwordContoller = TextEditingController();

  String email = '';

  String password = '';
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
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
                    child: const Image(
                      image: AssetImage('images/background.png'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Login',
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
                                    hintText: 'Email'),
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
                                
                                obscureText: isObscure,
                                validator: (value) => (value?.length ?? 0) < 6
                                    ? "Enter a password with more than 6 characters"
                                    : null,
                                controller: passwordContoller,
                                decoration: kTextFormDecoration.copyWith(
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  }, icon: isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
                                  
                                    hintText: 'Password'),
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                               
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Text('Forget Password?'),
                                    onTap: ()  {}
                                      
                                  ),
                                ],
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
                                  onPressed: () async{
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      dynamic result = await _auth
                                          .loginWithEmailandPassword(
                                              email, password);
                                      if(result == null){
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: const Text('Error loging in'),backgroundColor: Colors.red,)
                                        );
                                      }
                                    
                                    }
                                  },
                                  child: const Text(
                                    'Log In',
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
