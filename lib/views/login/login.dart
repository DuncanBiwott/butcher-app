import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/controller/Root/auth.dart';
import 'package:butcher_meat_ordering/views/home.dart';
import 'package:butcher_meat_ordering/views/login/forgot_pass.dart';
import 'package:butcher_meat_ordering/views/register/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';


class Login extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Login({
    Key? key,
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            height: 500,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Center(
                          child: Text(
                        "Login",
                        style: TextStyle(color: textColor, fontSize: 50),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: textColor),
                        controller: _emailcontroller,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          
                          label: Text("Email",style: TextStyle(color: textColor),),
                          hintText: "Email address",
                          border: OutlineInputBorder(
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
                        decoration:  InputDecoration(
                          fillColor: textColor,
                          label: Text("Password",style: TextStyle(color: textColor),),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                        obscureText: true,
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
                                            .signIn(
                                      email: _emailcontroller.text,
                                      password: _passwordcontroller.text,
                                    );
                                    if (rvalue == "Success") {
                                      _emailcontroller.clear();
                                      _passwordcontroller.clear();
                                      _showSuccessMessage(
                                          rvalue!, Colors.green);
                                      setState(() {
                                        _isLoading = false; // set loading state
                                      });
                                      Navigator.pushAndRemoveUntil<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                Home(
                                                  auth: widget.auth,
                                                  firestore: widget.firestore,
                                                )),
                                        ModalRoute.withName('/'),
                                      );
                                    }
                                  } catch (e) {
                                    setState(() {
                                      _isLoading = false; // set loading state
                                    });
                                    _showSuccessMessage(rvalue!, Colors.red);
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryButton),
                              ),
                              child: _isLoading
                                  ? const CircularProgressIndicator()
                                  :  Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Login",
                                            style: TextStyle(
                                                color: textColor,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    )),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPass()),
                              );
                            }),
                            child:  Text(
                              "Forgot Password?",
                              style: TextStyle(color: textColor),
                              
                            )),
                      ),
                    
                      Row(
                        children: [
                           Text("Don't have an account?",style: TextStyle(color: textColor),),
                          TextButton(
                              onPressed: (() {
                                Navigator.pushReplacement<void, void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => SignUp(
                                      auth: widget.auth,
                                      firestore: widget.firestore,
                                    ),
                                  ),
                                );
                              }),
                              child:  Text(
                                "Register",style: TextStyle(color: textColor),
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
