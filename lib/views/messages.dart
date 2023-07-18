import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/models/inventory.dart';
import 'package:butcher_meat_ordering/views/add_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/order_service.dart';

class Messages extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Messages({super.key, required this.auth, required this.firestore});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  final OrderService orderService = OrderService();

  Future<List<InventoryClass>>? _inventoryList;


  @override
  void initState() {
    super.initState();
    _inventoryList = orderService.getInventory();
 
  }

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: RefreshIndicator(
          color: Colors.blue,
        onRefresh: () {
          setState(() {
            _inventoryList = orderService.getInventory();
          });
          return _inventoryList!;
        },
          child: Padding(
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
        
                    FutureBuilder(
                      future: _inventoryList,
                      builder:(context,snapshot) {
        
                         if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return  Center(child: Text('Error retrieving data',style: TextStyle(color: textColor),),);
                        }else if(snapshot.data == null){
                          return  Center(child: Text('No Data Present',style: TextStyle(fontSize: 20,color: textColor,fontWeight: FontWeight.bold),));
                        }
                         else {
                          List<InventoryClass> inventory =
                              snapshot.data as List<InventoryClass>;
        
                              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: inventory.length,
                  
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
                              image:  DecorationImage(
                                image: NetworkImage(
                                  inventory[index].imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                inventory[index].type,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                inventory[index].source,
                                style: TextStyle(
                                  color: textColor,
                                ),
                              ),
                              Text(
                                'KES ${inventory[index].price} /Kg',
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
                                '${inventory[index].ratings}(${inventory[index].reviews})',
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
                );
        
                      }
        
        
                      }),
              
                  
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderForm(auth: widget.auth,firestore: widget.firestore,)));
          },
          child:  Icon(Icons.add,color: textColor,),
          backgroundColor: primaryButton,
        )
        
      ),
    );
  }
}