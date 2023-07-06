import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

Future _showSuccessMessage(BuildContext context, String massage, Color color) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color,
      message: massage,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
