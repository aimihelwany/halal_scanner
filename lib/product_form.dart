import 'package:flutter/material.dart';
import 'package:halal_scanner/database.dart';
import 'package:halal_scanner/loading.dart';
import 'package:halal_scanner/user.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> status = ['halal', 'nonhalal'];

  String _currentBarcode;
  String _status;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          
          UserData userData = snapshot.data;
          
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update products',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.barcode,
                  validator: (val) => val.isEmpty ? 'Enter barcode' : null,
                  onChanged: (val) => setState(() => _currentBarcode = val),
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  value: _status ?? userData.status,
                  items: status.map((halalstatus){
                    return DropdownMenuItem(
                      value: halalstatus,
                      child: Text('$halalstatus'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _status = val),
                ),
                RaisedButton(
                  color: Colors.green[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentBarcode ?? userData.barcode,
                        _status ?? userData.status, 
                      );
                      Navigator.pop(context);
                    }
                  }
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}