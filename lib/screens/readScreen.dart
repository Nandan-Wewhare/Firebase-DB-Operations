import 'package:firebase_operations/dbModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadData extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Results page'),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                Provider.of<Data>(context).result.toString()
              );
            }
            return CircularProgressIndicator();
          },
          future: Provider.of<Data>(context, listen: false).readValues(),
        ),
      ),
    );
  }
}
