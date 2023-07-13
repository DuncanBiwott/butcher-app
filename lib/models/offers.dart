import 'package:cloud_firestore/cloud_firestore.dart';

class OffersClass{
  final String butcheryName;
  final String imageUrl;
  final String type;
  final String price;
  final String quantity;

  OffersClass({
    required this.butcheryName,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.quantity,
  });

  factory OffersClass.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return OffersClass(
      butcheryName: data['butcheryName'],
      imageUrl: data['imageUrl'],
      type: data['type'],
      price: data['price'],
      quantity: data['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'butcheryName': butcheryName,
      'imageUrl': imageUrl,
      'type': type,
      'price': price,
      'quantity': quantity,
    };
  }

}