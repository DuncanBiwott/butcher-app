import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/controller/Root/auth.dart';
import 'package:butcher_meat_ordering/views/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Profile({super.key, required this.auth, required this.firestore});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);},
               icon:  Icon(FontAwesomeIcons.angleLeft,size: 24,color: textColor,)),
             Padding(
              padding: EdgeInsets.only(left:30.0),
              child: Text('My Profile',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: textColor),),
            ),
          ],
        ),
            Container(
              height: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading:  Icon(FontAwesomeIcons.user,size: 32,color: textColor,),
                  trailing:  Icon(FontAwesomeIcons.angleRight,color: textColor,),
                  title: Row(
                    children: [
                      Text("${widget.auth.currentUser?.email}",style: TextStyle(color: textColor),),
                      const Icon(Icons.verified,color: Colors.blue,)
                    ],
                  ) ,
                  onTap: () {
                    
                  },
                ),
              ),
            ),
            Divider(),
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
              child: Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: ListTile(
                  leading:  Icon(FontAwesomeIcons.creditCard,size: 32,color: textColor,),
                  trailing:  Icon(FontAwesomeIcons.angleRight,color: textColor,),
                  title:  Text("Payments & purchases",style: TextStyle(color: textColor),) ,
                  onTap: () {
                    
                  },
                ),
              ),
            ),
            Divider(),
             Text("Settings & Preferences",style: TextStyle(color: textColor),),
            const SizedBox(height: 5,),
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
              child: Padding(
                 padding: const EdgeInsets.only(bottom:10.0),
                child: ListTile(
                  leading:  Icon(Icons.notifications,color: textColor,),
                  title:  Text('Notification',style: TextStyle(color: textColor),),
                  trailing:  Icon(FontAwesomeIcons.angleRight,color: textColor,),
                  onTap: () {
                    
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
              child: Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: ListTile(
                  leading:  Icon(Icons.dark_mode,color: textColor,),
                  title:  Text('Dark Mode',style: TextStyle(color: textColor),),
                  trailing: Switch(
                    value: true, 
                    onChanged: (value) {
                   
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
              child: Padding(
                 padding: const EdgeInsets.only(bottom:10.0),
                child: ListTile(
                  title:  Text('Language',style: TextStyle(color: textColor),),
                  leading: Icon(FontAwesomeIcons.language,color: textColor,),
                  trailing:  Icon(FontAwesomeIcons.angleRight,color: textColor,),
                  onTap: () {
                    
                  },
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
              child: Padding(
                 padding: const EdgeInsets.only(bottom:10.0),
                child: ListTile(
                  title: Text('Security',style: TextStyle(color: textColor),),
                  leading: Icon(FontAwesomeIcons.shield,color: textColor,),
                 trailing:  Icon(FontAwesomeIcons.angleRight,color: textColor,),
                  onTap: () {
                    
                  },
                ),
              ),
            ),
            Divider(),
            //Support Section
            Text('Support',style: TextStyle(color: textColor),),
            const SizedBox(height: 5,),
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
              child: Padding(
                 padding: const EdgeInsets.only(bottom:10.0),
                child: ListTile(
                      title: Text('Help center',style: TextStyle(color: textColor),),
                      leading:  Icon(FontAwesomeIcons.book,color: textColor,),
                      trailing:  Icon(FontAwesomeIcons.angleRight,color: textColor,),
                      onTap: () {
                        
                      },
                    ),
              ),
            ),
            const SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Colors.grey),color: accent),
                  child: Padding(
                     padding: const EdgeInsets.only(bottom:10.0),
                    child: ListTile(
                      title: Text('Report a bug',style: TextStyle(color: textColor),),
                      leading: Icon(FontAwesomeIcons.flag,color: textColor,),
                     trailing:  Icon(FontAwesomeIcons.angleRight,color: textColor,),
                      onTap: () {
                        
                      },
                    ),
                  ),
                ),
                Divider(),
                TextButton(onPressed: ()async{
                  String? rvalue =
                    await Authenticate(auth: widget.auth).signOut();
                if (rvalue == "Success") {
                  _showSuccessMessage("Logout Successfull", Colors.green);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Login(
                        auth: widget.auth,
                        firestore: widget.firestore,
                      ),
                    ),
                  );
                } else {
                  _showSuccessMessage(rvalue!, Colors.red);
                }

                }, child:  Row(
                  children: [
                    Icon(FontAwesomeIcons.arrowRightToBracket,color: textColor),
                    SizedBox(width: 10,),
                    Text("Logout",style: TextStyle(color: textColor,letterSpacing: 0.5,fontSize: 24,fontWeight: FontWeight.bold),)
                  ],
                ))
          ],
        ),
      ),
    )
    );
  }
}

