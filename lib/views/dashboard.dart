import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  const Dashboard({super.key, required this.auth, required this.firestore});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("hello"),);
  }
}