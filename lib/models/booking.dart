import 'package:cloud_firestore/cloud_firestore.dart';

class BookingClass{
  final String contact;
  final String date;
  final String quantity;
  final String type;
  final String userId;
  final String imageUrl;
  final String paymentMethod;
  final String preferedCut;
  final String? dietaryPreference;
  final String price;

  BookingClass({
    required this.contact,
    required this.date,
    required this.quantity,
    required this.type,
    required this.userId,
    required this.imageUrl,
    required this.paymentMethod,
    required this.preferedCut,
     this.dietaryPreference,
    required this.price,
  });

  factory BookingClass.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return BookingClass(
      contact: data['contact'],
      date: data['date'],
      quantity: data['quantity'],
      type: data['type'],
      userId: data['userId'],
      imageUrl: data['imageUrl'],
      paymentMethod: data['paymentMethod'],
      preferedCut: data['preferedCut'],
      dietaryPreference: data['dietaryPreference'],
      price: data['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
    };
  }

}