import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Messages({super.key, required this.auth, required this.firestore});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white70,
                      ),
                      child: Row(
                        children: [
                           Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "Fresh Mutton ",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon:  Icon(
                              Icons.search,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            
                SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: 15,
                
                  itemBuilder: (context, index) {
                    
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
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
                    ),
                    );
                  },
                ),
              ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child:  Icon(Icons.add,color: textColor,),
          backgroundColor: primaryButton,
        )
        
      ),
    );
  }
}