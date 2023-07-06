import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const Dashboard({Key? key, required this.auth, required this.firestore}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          actions: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
              ),
              margin: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.basketShopping,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white70,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "bonless  mutton meat ",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.9,
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
                              top: 50,
                              left: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Goat Fresh Meat',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '20 Suppliers',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.9,
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
                              top: 50,
                              left: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sheep Fresh Meat',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '20 Suppliers',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  opacity: 0.7,
                                  image: NetworkImage(
                                    
                                      'https://kz.all.biz/img/kz/catalog/810730.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                             Positioned(
                              top: 50,
                              left: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mutton',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                   Text(
                                    '20 Suppliers',
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
                      ),
                      // Other containers with images and text
                    ],
                  ),
                ),
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
            child: Text(
              'Featured Offers',
              style: TextStyle(
                fontSize: 24,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        ],
      ),

      SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  
                  return Card(
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://kz.all.biz/img/kz/catalog/810730.jpeg",
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Beef",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'by Kevoo Butcher',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 32,),
            Container(
                    height: 50,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [       
                          Container(
                            width:40,
                            height: 20,
                            child:  Center(child: Text('1KG',style: TextStyle(color: Colors.white),)),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Text("\$ 100",style: TextStyle(color: Colors.white),),
                        ]
                      ),
                    )
                  ),
          ],
        ),
      ),
    );
                },
              ),
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
            child: Text(
              'Recently Ordered',
              style: TextStyle(
                fontSize: 24,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
        ],
      ),
      Container(
  height: 100,
  decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(10),
  ),
  child: ListTile(
    leading: Container(
      width: 50,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
            'https://townsquare.media/site/101/files/2019/04/GettyImages-639237570.jpg?w=980&q=75',
          ),
          fit: BoxFit.cover,
        ),
      ),
    ),
    title:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mutton Best Meat',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          'By Suppliers',
          style: TextStyle(
            color: textColor,
          ),
        ),
        Text(
          '\$ Price per Kg',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    ),
    trailing:  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(
          '4.5(200)',
          style: TextStyle(
            fontWeight: FontWeight.bold,color: textColor,
          ),
        ),
      ],
    ),
  ),
)


      
              ],
            ),
          ),
        ),
      ),
    );
  }
}