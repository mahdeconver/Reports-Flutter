import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/provider.dart';
import '../screen/user/home-screen.dart';

class RegisterButtonAdmin extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController address;
  final TextEditingController password;
  final GlobalKey<FormState> mykey;

  const RegisterButtonAdmin({
    Key? key,
    required this.email,
    required this.password,
    required this.name,
    required this.address,
    required this.mykey,
  }) : super(key: key);

  @override
  State<RegisterButtonAdmin> createState() => _RegisterButtonAdminState();
}

class _RegisterButtonAdminState extends State<RegisterButtonAdmin> {
  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 5.0),
          padding: MaterialStateProperty.resolveWith(
              (states) => const EdgeInsets.all(15)),
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
        ),
        onPressed: () async {
          setState(() {
            if (widget.mykey.currentState!.validate()) {
              if (widget.email.text.trim().toLowerCase().isNotEmpty &&
                  widget.password.text.trim().isNotEmpty &&
                  widget.address.text.trim().isNotEmpty &&
                  widget.name.text.trim().toLowerCase().isNotEmpty) {
                {
                  myprovider.RegisterAdmin(
                          name: " ${widget.name.text}",
                          email: " ${widget.email.text}",
                          address: "${widget.address.text}",
                          password: "${widget.password.text}")
                      .whenComplete(() {
                    if (myprovider.status) {
                      _showDialog(context, myprovider.data['message']);
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  HomeScreen(),
                          ));
                    }
                  });
                }
              }
            }
          });
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            color: Color(0xff1242fe),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context, massageError) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failed'),
          content: Text('$massageError'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
