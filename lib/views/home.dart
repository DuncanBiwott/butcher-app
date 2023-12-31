import 'package:butcher_meat_ordering/views/add_order.dart';
import 'package:butcher_meat_ordering/views/messages.dart';
import 'package:butcher_meat_ordering/views/order_page.dart';
import 'package:butcher_meat_ordering/views/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dashboard.dart';

class Home extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Home({Key? key, required this.auth, required this.firestore}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 late User? user;
   @override
  void initState() {
    super.initState();
    user = widget.auth.currentUser;
  }

 

  int _selectedIndex = 0;

  List<Widget> _pages ()=><Widget> [
    Dashboard(auth:widget.auth, firestore: widget.firestore,),
    Messages(auth:widget.auth, firestore: widget.firestore,),
    OrderPage(userId: user!.uid, auth: widget.auth,),
    OrderForm(auth: widget.auth, firestore: widget.firestore),
    Profile(auth: widget.auth, firestore: widget.firestore,)
    
  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: _pages()[_selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house,size: 20.0,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore,size: 20.0),
              label: "Bookings",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.book,size: 20.0),
              label: "My Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plus,size: 20.0),
              label: "Add Order",
            ),
           
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user,size: 20.0),
              label: "Profile",
            ),
            
            
          ]),
      )
      
      
      
    );
  }
}