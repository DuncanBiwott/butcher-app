import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryClass{
  String description;
  String imageUrl;
  String dietaryLabel;
  String price;
  String quantity;
  String type;
  String qualities;
  String ratings;
  String reviews;
  String source;

  InventoryClass({
    required this.description,
    required this.imageUrl,
    required this.dietaryLabel,
    required this.price,
    required this.quantity,
    required this.type,
    required this.qualities,
    required this.ratings,
    required this.reviews,
    required this.source,
  });

  factory InventoryClass.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return InventoryClass(
      description: data['description']?? '',
      imageUrl: data['imageUrl']?? '',
      dietaryLabel: data['dietaryLabel']?? '',
      price: data['price']?? '',
      quantity: data['quantity']?? '',
      type: data['type']?? '',
      qualities: data['qualities']?? '',
      ratings: data['ratings']?? '',
      reviews: data['reviews']?? '',
      source: data['source']?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'imageUrl': imageUrl,
      'dietaryLabel': dietaryLabel,
      'price': price,
      'quantity': quantity,
      'type': type,
      'qualities': qualities,
      'ratings': ratings,
      'reviews': reviews,
      'source': source,
    };
  }
}