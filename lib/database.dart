//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:halal_scanner/product.dart';
//import 'package:halal_scanner/user.dart';

class DatabaseService {
  
  final String uid;
  DatabaseService({ this.uid });

  //final CollectionReference productCollection = Firestore.instance.collection('products');

  //Future updateUserData(String barcode, String status) async {
  //  return await productCollection.document(uid).setData({
  //    'barcode': barcode,
  //    'status': status,
  //  });
  //}

  //List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
  //  return snapshot.documents.map((doc){
  //    return Product(
  //      barcode: doc.data['barcode'] ?? '',
  //      status: doc.data['status'] ?? '',
  //    );
  //  }).toList();
  //}

  //UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
  //  return UserData(
  //    uid: uid,
  //    barcode: snapshot.data['barcode'],
  //    status: snapshot.data['status'],
  //  );
  //}

  //Stream<List<Product>> get products {
  //  return productCollection.snapshots()
  //  .map(_productListFromSnapshot);
  //}

  //Stream<UserData> get userData {
  //  return productCollection.document(uid).snapshots()
  //  .map(_userDataFromSnapshot);
  //}
  
}