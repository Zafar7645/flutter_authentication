import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  // const RegistrationScreen({Key? key}) : super(key: key);
  String phoneNumber;
  RegistrationScreen({required this.phoneNumber});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Center(
        child: Card(
          elevation: 20,
          child: Container(
            height: 250,
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                ),
                TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      hintText: "Address",
                    )),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('user_details')
                        .add({
                      'name': nameController.text,
                      'phone': widget.phoneNumber,
                      'address': addressController.text,
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            name: nameController.text,
                            phoneNumber: widget.phoneNumber,
                            address: addressController.text,
                          ),
                        ));
                  },
                  child: Text('Proceed'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
