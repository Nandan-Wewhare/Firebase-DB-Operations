import 'package:firebase_operations/dbModel.dart';
import 'package:firebase_operations/screens/readScreen.dart';
import 'package:firebase_operations/screens/writeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ChangeNotifierProvider(
          create: (_) => Data(),
          child: MaterialApp(
            home: Home(),
          ),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DB operations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('WRITE DATA'),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => WriteData(),
                    ));
              },
            ),
            RaisedButton(
              child: Text('READ DATA'),
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ReadData()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
