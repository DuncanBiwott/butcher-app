import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/services/order_service.dart';
import 'package:butcher_meat_ordering/views/order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class OrderPage extends StatefulWidget {
  final String userId;

  OrderPage({required this.userId, required FirebaseAuth auth});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Future<List<OrderClass>>? _ordersFuture;
  final OrderService orderService = OrderService();
  TabController? _tabController;

  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Container(
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
                            hintText: "Search your order",
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
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}
