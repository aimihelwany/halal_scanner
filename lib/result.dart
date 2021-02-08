import 'package:flutter/material.dart';
import 'package:halal_scanner/auth.dart';

class HalalResult extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/logo_halal.png'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset('assets/logo_right.png',
                    width: 50,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('This product is HALAL certified',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}