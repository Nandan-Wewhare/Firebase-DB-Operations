import 'dart:developer';

import 'package:firebase_operations/dbModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteData extends StatelessWidget {
  String normalValidator(String value) => value.isEmpty ? 'Required' : null;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameController = TextEditingController();
  final _cropController = TextEditingController();
  final _quantController = TextEditingController();
  final _priceController = TextEditingController();
  final _addController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Writing screen'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              customTextField('Farmer Name', _nameController),
              customTextField('Crop Name', _cropController),
              customTextField('Quantity', _quantController),
              customTextField('Price', _priceController),
              customTextField('Address', _addController),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    log('write', time: DateTime.now());

                    Provider.of<Data>(context, listen: false).createValues(
                        _nameController.text,
                        _cropController.text,
                        _quantController.text,
                        _priceController.text,
                        _addController.text);
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Data Submitted'),
                      duration: Duration(seconds: 2),
                    ));
                  }
                  _nameController.clear();
                  _cropController.clear();
                  _quantController.clear();
                  _priceController.clear();
                  _addController.clear();
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding customTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        padding: EdgeInsets.all(5),
        child: TextFormField(
          controller: controller,
          validator: normalValidator,
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      ),
    );
  }
}
