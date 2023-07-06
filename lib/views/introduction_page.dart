import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/views/login/login.dart';
import 'package:butcher_meat_ordering/views/register/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IntroDuctionScreen extends StatefulWidget {
  const IntroDuctionScreen({super.key});

  @override
  State<IntroDuctionScreen> createState() => _IntroDuctionScreenState();
}

class _IntroDuctionScreenState extends State<IntroDuctionScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> titles = [
    'Hotel Reservation',
    'Restaurant Booking',
    'Flight Reservations',
  ];

  final List<String> subtitles = [
    'Find and book the perfect hotel for your trip',
    'Discover and reserve top-rated restaurants',
    'Book flights to your desired destinations',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
               Center(child: Text("hello"),),
                Center(child: Text("hello"),),
                Center(child: Text("hello"),),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Login(auth: _auth, firestore: _firestore)),
                          );
                        },
                        icon:  Icon(
                          Icons.arrow_forward,
                          color: textColor,
                        ),
                        label:  Text(
                          'Login',
                          style: TextStyle(color: textColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 300,
                    child: Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SignUp(auth: _auth, firestore: _firestore)),
                          );
                        },
                        icon:  Icon(
                          Icons.arrow_forward,
                          color: textColor,
                        ),
                        label:  Text(
                          'Register',
                          style: TextStyle(color: textColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlide(String imagePath, String title, String subtitle) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 16,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isActive ? Colors.white : Colors.grey[400],
      ),
    );
  }
}
