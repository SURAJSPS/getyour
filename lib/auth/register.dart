import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getyour/auth/login.dart';
import 'package:getyour/google/firebase_auth.dart';
import 'package:getyour/my_home_page.dart';

class Register extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();

final passwordController = TextEditingController();
final confPasswordController = TextEditingController();
String? _userEmail = '';
String? _userNam = '';
String? _userPhone = '';

String? _userPassword = '';
String? _userConformPassword = '';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _RegisterState extends State<Register> {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop(MaterialPageRoute(
                              builder: (context) => LogIn(),
                            ));
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'OTOS',
                          style: TextStyle(color: Colors.white, fontSize: 29),
                        ),
                        SizedBox(
                          width: 10,
                        )
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
                          'Creat an Account',
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
                            child: _userName(),
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
                            child: _phoneNumber(),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: _confPassword(),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.symmetric(horizontal: 125),
                          onPressed: () {
                            final isValid = _formKey.currentState?.validate();
                            FocusScope.of(context).unfocus();
                            if (isValid != null) {
                              if (isValid) {
                                _formKey.currentState?.save();
                                _creatAccount(context);

                                // Use those value to send our auth request for signup..........
                              }
                            }
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
      validator: (value) {
        if (value != null) {
          if (!value.isNotEmpty || !value.contains("@")) {
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

Widget _userName() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: nameController,
      key: ValueKey('userName'),
      onSaved: (value) {
        _userNam = value;
      },
      validator: (value) {
        if (value != null) {
          if (!value.isNotEmpty) {
            return "Pleas enter a full Name.";
          }
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your  Full Name',
        labelText: 'Name',
        border: InputBorder.none,
      ),
    ),
  );
}

Widget _phoneNumber() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      // maxLength: 10,
      controller: phoneController,
      key: ValueKey('userPhone'),
      onSaved: (value) {
        _userPhone = value;
      },
      validator: (value) {
        if (value != null) {
          if (!value.isNotEmpty) {
            return "Pleas enter valid phone Number.";
          }
          if (value.length > 10) {
            return "Pleas enter 10 digit phone Number.";
          }
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your  Phone Number',
        labelText: 'Phone',
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
        _userPassword = value;
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

// conform password widget
Widget _confPassword() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      controller: confPasswordController,
      key: ValueKey('conformPassword'),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty || value.length < 4) {
            return "Your password should not match";
          }
        }
        return null;
      },
      onSaved: (value) {
        _userConformPassword = value;
      },
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter Conform Password',
        labelText: 'Conform Password',
        border: InputBorder.none,
      ),
    ),
  );
}

/// creat account button
_creatAccount(context) {
  creatAccount(
          name: _userNam,
          email: _userEmail,
          phoneNumber: _userPhone,
          password: _userPassword,
          conformPassword: _userConformPassword)
      .then((user) {
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
    }
  });
}
