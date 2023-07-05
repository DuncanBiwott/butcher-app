import 'package:butcher_meat_ordering/controller/Root/root.dart';
import 'package:butcher_meat_ordering/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MeatOrderingApp());
}


class MeatOrderingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meat Ordering App',
      theme: ThemeData(
        useMaterial3: true,
        backgroundColor: background,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Root(),
    );
  }
}

