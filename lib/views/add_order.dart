import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
   final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const OrderForm({super.key, required this.auth, required this.firestore});
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? name;
  String? contact;
  String? date;
  String? email;
  String? orderId;
  String? deliveryAddress;
  String? paymentMethod;
  String? dietaryPreference;
  String? additionalInfo;
  String? deliveryOption;
  String? cutPreparation;
  String? price;
  String? quantity;
  String? type;

  List<String> quantityOptions = ['1', '2', '3', '4', '5'];
  List<String> paymentMethodOptions = ['Credit Card', 'PayPal', 'Cash on Delivery'];
  List<String> dietaryPreferenceOptions = ['Vegetarian', 'Vegan', 'Halal', 'Kosher', 'Gluten-free'];
  List<String> deliveryOptionOptions = ['Home Delivery', 'Pickup'];
  List<String> cutPreparationOptions = ['Bone-in', 'Boneless', 'Thinly sliced', 'Ground'];
  List<String> typeOptions = ['Beef', 'Chicken', 'Pork', 'Lamb', 'Other'];


  void showTypeDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: typeOptions.map((String option) {
                return ListTile(
                  title: Text(option),
                  onTap: () {
                    setState(() {
                      type = option;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place an Order'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Order ID'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an order ID';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    orderId = value;
                  },
                ),

                InkWell(
                  onTap: () {
                    showTypeDropdown();
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Type',
                      border: OutlineInputBorder(),
                    ),
                    child: Text(type ?? 'Select Type'),
                  ),
                ),
            
                DropdownButtonFormField<String>(
                  value: quantity,
                  items: quantityOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      quantity = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Quantity'),
                ),
                DropdownButtonFormField<String>(
                  value: paymentMethod,
                  items: paymentMethodOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Payment Method'),
                ),
                DropdownButtonFormField<String>(
                  value: dietaryPreference,
                  items: dietaryPreferenceOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dietaryPreference = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Dietary Preference'),
                ),
                DropdownButtonFormField<String>(
                  value: deliveryOption,
                  items: deliveryOptionOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      deliveryOption = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Delivery Option'),
                ),
                DropdownButtonFormField<String>(
                  value: cutPreparation,
                  items: cutPreparationOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      cutPreparation = value!;
                    });
                  },
                  decoration: const InputDecoration(labelText: 'Cut Preparation'),
                ),
                DropdownButtonFormField<String>(
                  value: type,
                  items: typeOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      type = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Type'),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryButton
                  ),
                  child: Text('Submit',style: TextStyle(color: textColor),),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                     
                   
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
