import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Data extends ChangeNotifier {
  var result;
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  int id = 1001;

  void createValues(
      String fname, String crop, String quan, String price, String address) {
    ref.child(id.toString()).set({
      'fname': fname,
      'cropname': crop,
      'quantity': quan,
      'price': price,
      'address': address
    });
    id++;
    notifyListeners();
  }

  Future<String> readValues() async {
    DataSnapshot query = await ref.once();
    var firebaseResult = query.value;
    result = firebaseResult;
    print(firebaseResult);
    return 'Done';
  }
}
