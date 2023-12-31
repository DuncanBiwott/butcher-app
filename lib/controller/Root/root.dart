
import 'package:butcher_meat_ordering/controller/Root/auth.dart';
import 'package:butcher_meat_ordering/views/home.dart';
import 'package:butcher_meat_ordering/views/introduction_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
 final FirebaseAuth _auth=FirebaseAuth.instance;
 final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:Authenticate(auth: _auth).user ,
      builder: (BuildContext context,AsyncSnapshot<User?>snapshot){
        if(snapshot.connectionState==ConnectionState.active){
          if(snapshot.data?.uid==null){

            return const IntroDuctionScreen();
          }else{
            return Home(auth: _auth, firestore: _firestore);
          }

        }else{
          return const Scaffold(
            body: Center(
              child: Text("Loading....."),
            ),
          );
        }

        
      });
  }
}