import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:getyour/auth/register.dart';
import 'package:getyour/google/firebase_auth.dart';
import 'package:getyour/my_home_page.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

final emailController = TextEditingController();

final passwordController = TextEditingController();
String? _userEmail = '';
String? _userPass = '';
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                // color: Colors.blue,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OTOS',
                          style: TextStyle(color: Colors.white, fontSize: 29),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: new Positioned(
                  left: 0.0,
                  top: 150.0,
                  child: new Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white24.withOpacity(.8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: _emailAddress(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: _password(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.symmetric(horizontal: 170),
                          onPressed: () {
                            final isValid = _formKey.currentState?.validate();
                            FocusScope.of(context).unfocus();
                            if (isValid != null) {
                              if (isValid) {
                                _formKey.currentState?.save();
                                _loginButton(context);
                                // Use those value to send our auth request for signup..........
                              }
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Need an Account? ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                              text: 'Register here',
                              style: TextStyle(color: Colors.black),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ));
                                  print('Register Button');
                                })
                        ])),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Email Widget
Widget _emailAddress() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: emailController,
      key: ValueKey('email'),
      onSaved: (value) {
        _userEmail = value;
      },
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty || !value.contains("@")) {
            return "Pleas enter a valid email address.";
          }
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your  Email',
        labelText: 'Email',
        border: InputBorder.none,
      ),
    ),
  );
}

// password widget
Widget _password() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: passwordController,
      key: ValueKey('password'),
      onSaved: (value) {
        _userPass = value;
      },
      validator: (value) {
        if (value != null) {
          if (!value.isNotEmpty || value.length < 4) {
            return "Password must be at list 5 characters long";
          }
        }
      },
      // maxLength: 10,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter your  password',
        labelText: 'Password',
        border: InputBorder.none,
      ),
    ),
  );
}

/// Login Onpress work
_loginButton(context) {
  loginAccount(_userEmail, _userPass).then((user) {
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
    }
  });
}
