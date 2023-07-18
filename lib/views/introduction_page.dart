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
              children: [
                Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  opacity: 0.7,
                                  image: NetworkImage(
                                      'https://img.freepik.com/premium-photo/fresh-raw-beef-steak-isolated-white-background-with-clipping-path_228338-124.jpg?w=2000'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                             Positioned(
                              bottom: 250,
                              left: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Indulge in the mouthwatering flavors of our premium-quality meat. Sourced from trusted suppliers, our meat guarantees a dining experience like no other.',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Delicious and Tender',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                           Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  opacity: 0.7,
                                  image: NetworkImage(
                                      'https://s3.envato.com/files/250987736/_MG_5079.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                             Positioned(
                              bottom: 250,
                              left: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Whether its a backyard barbecue or a special family dinner, our selection of prime meat cuts has you covered. Juicy steaks, succulent roasts, and more – elevate your meals with the finest meats.',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Prime Cuts for Every Occasion',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                           Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  opacity: 0.7,
                                  image: NetworkImage(
                                      'https://img.freepik.com/free-photo/steak-raw-fresh-meat-with-rosemary_105495-275.jpg?size=626&ext=jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                             Positioned(
                              bottom: 250,
                              left: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Enjoy meat that comes from ethically raised animals, ensuring the highest quality and a positive impact on the environment. Taste the difference of sustainably sourced meat.',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Farm-Fresh and Sustainable',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
          
               
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
                    child: SizedBox(
                      width: double.infinity,
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
