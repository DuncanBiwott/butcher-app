import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/controller/Root/auth.dart';
import 'package:butcher_meat_ordering/views/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPass extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final TextEditingController _emailcontroller = TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  "Enter your Email addresss here",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                 
                  borderSide: BorderSide(
                    color: textColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                
                  borderSide: BorderSide(
                    color: textColor,
                    width: 2.0,
                  ),
                ),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                  validator: (email) => !EmailValidator.validate(email!) ?
                  "Enter Valid Email":null,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final form=formkey.currentState;
                    if(form!.validate()){
                      final emailfield=_emailcontroller.text;

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));

                             final rvalue = await Authenticate(auth: widget.auth)
                        .resetPassword(email: emailfield);
                    Navigator.of(context).popUntil((route) => false);
          
                    if (rvalue == "Success") {
                      _emailcontroller.clear();
          
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text("Password reset Email sent"),
                            actions: [
                              TextButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login(auth:widget.auth, firestore: widget.firestore)),
                          );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(rvalue!)),
                      );
                    }
                      
                    }
                    
          
                   
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          primaryButton)),
                  child:  Center(
                      child: Text(
                    "Verify",
                    style: TextStyle(color: textColor,letterSpacing: 0.5),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}