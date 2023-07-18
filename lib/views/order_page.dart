import 'package:butcher_meat_ordering/constants/constants.dart';
import 'package:butcher_meat_ordering/services/order_service.dart';
import 'package:butcher_meat_ordering/models/order.dart';
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

    @override
  void initState() {
    super.initState();
    _ordersFuture = orderService.getOrders(userId: widget.userId);
  }

  void dispose() {
    _tabController!.dispose();
    super.dispose();
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
            _ordersFuture = orderService.getOrders(userId: widget.userId);
          });
          return _ordersFuture!;
        },
          child: SingleChildScrollView(
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
        
                 FutureBuilder(
                    future: _ordersFuture,
                  
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error retrieving data'));
        
        
                        }else if(snapshot.data == null){
                          return  Center(child: Text('No orders Placed yet',style: TextStyle(fontSize: 20,color: textColor,fontWeight: FontWeight.bold),));
                        }
                         else{
                          List<OrderClass> orders = snapshot.data as List<OrderClass>;
        
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount: orders.length,
                              itemBuilder: (context,index){
                                return  Container(
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
                              orders[index].imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders[index].type,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            orders[index].type,
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          Text(
                            'KES ${orders[index].price}/kg',
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            '4.5(200)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
        
                              }
                              ),
                          );
                        }
                      
                    })),
                ],
              ),
            ),
          ),
        ),
        
      ),
    );
  }
}
