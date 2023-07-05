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
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings', style: TextStyle(color: Colors.black,fontSize: 24),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.blue,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,color: Colors.blue,),
            onPressed: () {
              setState(() {
                _ordersFuture = orderService.getOrders(userId: widget.userId);
              });
            },
          ),
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.blue,
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.upcoming),
              text: 'Upcoming',
            ),
            Tab(
              icon: Icon(Icons.history),
              text: 'History',
            ),
          ],
        )
      ),
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: () {
          setState(() {
            _ordersFuture = orderService.getOrders(userId: widget.userId);
          });
          return _ordersFuture!;
        },
        child: TabBarView(
          controller: _tabController,
          children: [
            FutureBuilder(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error retrieving orders'));
            } else {
              List<OrderClass> orders = snapshot.data as List<OrderClass>;
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: const Icon(Icons.shopping_basket),
                        title: Text(
                          order.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5.0),
                            Text(
                              'Order Type: ${order.type}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Price: \$${order.price.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Date: ${order.date}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        FutureBuilder(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error retrieving orders'));
            } else {
              List<OrderClass> orders = snapshot.data as List<OrderClass>;
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: const Icon(Icons.shopping_basket),
                        title: Text(
                          order.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5.0),
                            Text(
                              'Order Type: ${order.type}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Price: \$${order.price.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'Date: ${order.date}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
          ],
          )
      ),
    );
  }
}
