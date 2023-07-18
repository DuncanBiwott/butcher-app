
import 'package:butcher_meat_ordering/controller/Root/auth.dart';
import 'package:butcher_meat_ordering/views/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

import '../../constants/constants.dart';


class SignUp extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  SignUp({
    Key? key,
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _cpasswordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

 

  bool _isLoading = false;

  Future _showSuccessMessage(String massage, Color color) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color,
      message: massage,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              height: 700,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Center(
                          child: Text(
                        "Register",
                        style: TextStyle(color: textColor, fontSize: 50),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: textColor),
                        controller: _namecontroller,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          label: Text(
                            "Name",
                            style: TextStyle(color: textColor),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: textColor),
                        controller: _emailcontroller,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          label: Text(
                            "Email",
                            style: TextStyle(color: textColor),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: textColor),
                        controller: _passwordcontroller,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          label: Text(
                            "Password",
                            style: TextStyle(color: textColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: textColor),
                        controller: _cpasswordcontroller,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text(
                            "Confirm Password",
                            style: TextStyle(color: textColor),
                          ),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _passwordcontroller.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String? rvalue;

                                  try {
                                    setState(() {
                                      _isLoading = true; // set loading state
                                    });

                                    rvalue =
                                        await Authenticate(auth: widget.auth)
                                            .createAccount(
                                      email: _emailcontroller.text,
                                      password: _passwordcontroller.text,
                                    );
                                    if (rvalue == "Success") {
                                      _emailcontroller.clear();
                                      _passwordcontroller.clear();
                                      _showSuccessMessage(
                                          "Registration Successfull",
                                          Colors.green);
                                      setState(() {
                                        _isLoading = false; // set loading state
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login(
                                                  auth: widget.auth,
                                                  firestore: widget.firestore,
                                                )),
                                      );
                                    }
                                  } catch (e) {
                                    setState(() {
                                      _isLoading = false; // set loading state
                                    });
                                    _showSuccessMessage(
                                        "Registration  failed", Colors.red);
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryButton),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: textColor,
                                          letterSpacing: 0.5),
                                    ),
                                  ],
                                ),
                              )),
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Text("Already have an account?",
                                style: TextStyle(color: textColor)),
                          TextButton(
                              onPressed: (() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Login(
                                          auth: widget.auth,
                                          firestore: widget.firestore,
                                        )));
                              }),
                              child:  Text(
                                "Login",
                                style: TextStyle(
                                    color:textColor, letterSpacing: 0.5),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
