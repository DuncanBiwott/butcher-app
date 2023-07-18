


import 'dart:math';

import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

import '../models/booking.dart';
import '../models/inventory.dart';
import '../models/offers.dart';

class OrderService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> bookMeat({ required String contact,
   required String date,
  required String quantity,
   required String type,
   required String userId,
   required String imageUrl,
   required String paymentMethod,
   required String preferedCut,
   String? dietaryPreference,
   required String price
     } ) async {
    try {
      await firestore.collection('bookings').add({
        'contact': contact,
        'date': date,
        'quantity': quantity,
        'type': type,
        'userId': userId,
        'imageUrl': imageUrl,
        'paymentMethod': paymentMethod,
        'preferedCut': preferedCut,
        'dietaryPreference': dietaryPreference,
        'price': price,
      });
    } catch (e) {
      print('Error booikng the Meat: $e');
    }
  }

  Future<List<OrderClass>> getOrders({required String userId}) async {
    QuerySnapshot ordersSnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .get();
    List<OrderClass> orders = [];
    ordersSnapshot.docs.forEach((doc) {
      orders.add(OrderClass.fromSnapshot(doc));
    });
    return orders;
  }

  Future<List<BookingClass>> getbookings({required String userId}) async {
    QuerySnapshot ordersSnapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .get();
    List<BookingClass> bookings = [];
    ordersSnapshot.docs.forEach((doc) {
      bookings.add(BookingClass.fromSnapshot(doc));
    });
    return bookings;
  }

 Future<List<OffersClass>> getOffers() async {
  try {
    QuerySnapshot hotelSnapshot = await FirebaseFirestore.instance
        .collection('offers')
        .get();
    List<OffersClass> offers = [];
    hotelSnapshot.docs.forEach((doc) {
      offers.add(OffersClass.fromSnapshot(doc));
    });
    return offers;
  } catch (error) {
    print("Error fetching offers: $error");
    return []; 
  }
}

  Future<List<InventoryClass>> getInventory() async {
  try {
    QuerySnapshot hotelSnapshot = await FirebaseFirestore.instance
        .collection('inventory')
        .get();
    List<InventoryClass> inventory = [];
    hotelSnapshot.docs.forEach((doc) {
      inventory.add(InventoryClass.fromSnapshot(doc));
    });
    return inventory;
  } catch (error) {
    print("Error fetching inventory: $error");
    return []; 
  }
}



  Future<void> addOrder({
    required String orderId,
    required String name,
    required String contact,
    required String date,
    required String email,
    required String deliveryAddress,
    required String userId,
    required String imageUrl,
    required String paymentMethod,
    required String dietaryPreference,
     String? additionalInfo,
    required String deliveryOption,
    required String cutPreparation,
    required String price,
    required String quantity,
    required String type,
    required BuildContext context,
  }) async {
    try {
      // Show confirmation dialog
      bool confirm = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text('Confirmation',style: TextStyle(color: textColor),),
            content:  Text('Are you sure you want to add this order?',style: TextStyle(color: textColor)),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:secondaryButton,
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child:  Text('Cancel',style: TextStyle(color: textColor),),
              ),
              ElevatedButton(
                style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      primaryButton,
                    ),
                  ),
                onPressed: () {
                  Navigator.of(context).pop(true); 
                },
                child:  Text('Confirm',style: TextStyle(color: textColor),),
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        await firestore.collection('orders').add({
          'name': name,
          'contact': contact,
          'date': date,
          'email': email,
          'deliveryAddress': deliveryAddress,
          'userId': userId,
          'imageUrl': imageUrl,
          'paymentMethod': paymentMethod,
          'dietaryPreference': dietaryPreference,
          'additionalInfo': additionalInfo,
          'deliveryOption': deliveryOption,
          'cutPreparation': cutPreparation,
          'price': price,
          'quantity': quantity,
        });

        // Show success Flushbar
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          message: 'Order added successfully',
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
        )..show(context);
      }
    } catch (e) {
      print('Error adding order: $e');

      // Show error Flushbar
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        message: 'An error occurred while adding the order $e',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      )..show(context);
    }
 }

 String generateOrderNumber() {
  DateTime now = DateTime.now();
  String timestamp = now.millisecondsSinceEpoch.toString();

  Random random = Random();
  int randomNumber = random.nextInt(10000); 

  String orderNumber = timestamp + randomNumber.toString();

  return orderNumber;
}

}
