
import 'package:flutter/material.dart';

Future<dynamic> navigateTo(context, Widget widget) =>
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => widget),
    );