import 'package:cloud_firestore/cloud_firestore.dart';

class OrderClass {
 

     String orderId;
     String name;
     String contact;
     String date;
     String email;
     String deliveryAddress;
     String userId;
     String imageUrl;
     String paymentMethod;
     String dietaryPreference;
     String? additionalInfo;
     String deliveryOption;
     String cutPreparation;
     String price;
     String quantity;
    String type;
  
  OrderClass({
    required this.orderId,
    required this.name,
    required this.contact,
    required this.date,
    required this.email,
    required this.deliveryAddress,
    required this.userId,
    required this.imageUrl,
    required this.paymentMethod,
    required this.dietaryPreference,
    required this.additionalInfo,
    required this.deliveryOption,
    required this.cutPreparation,
    required this.price,
    required this.quantity,
    required this.type,
  });

  factory OrderClass.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return OrderClass(
      orderId: data['orderId'],
      name: data['name'],
      contact: data['contact'],
      date: data['date'],
      email: data['email'],
      deliveryAddress: data['deliveryAddress'],
      userId: data['userId'],
      imageUrl: data['imageUrl'],
      paymentMethod: data['paymentMethod'],
      dietaryPreference: data['dietaryPreference'],
      additionalInfo: data['additionalInfo'],
      deliveryOption: data['deliveryOption'],
      cutPreparation: data['cutPreparation'],
      price: data['price'],
      quantity: data['quantity'],
      type: data['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
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
      'type': type,
    };
  }
  
 
}