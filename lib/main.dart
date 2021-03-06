import 'package:flutter/material.dart';
import 'package:halal_scanner/auth.dart';
import 'package:halal_scanner/user.dart';
import 'package:halal_scanner/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

