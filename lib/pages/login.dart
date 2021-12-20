import 'package:crypto_app/pages/home.dart';
import 'package:crypto_app/pages/widgets/input_decoration.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'SIGN IN',
              style: _themeData.textTheme.headline4!.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value.trim();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    decoration: filledInputDecoration(hint: 'Email'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    decoration: filledInputDecoration(hint: 'Password'),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //Can be extracted into a separate widget but for readability sake i will leave it here.
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        //use a static email and password to simulate the login experience
                        final mockedEmail = "mike@gmail.com";
                        final mockedPassword = "12345";

                        if (_formKey.currentState!.validate()) {
                          if (email == mockedEmail && password == mockedPassword) {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => Home()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Wrong email or password')),
                            );
                          }
                        }
                      },
                      child: Text(
                        'SIGN IN',
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        backgroundColor: MaterialStateProperty.all(primaryColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                        foregroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
