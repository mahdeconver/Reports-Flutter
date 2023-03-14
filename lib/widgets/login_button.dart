import 'package:flutter/material.dart';
import 'package:peport_app/screen/user/home-screen.dart';
import 'package:provider/provider.dart';
import '../models/provider.dart';
import '../screen/admin/all_usaer.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> mykey;
  const LoginButton({
    Key? key,
    required this.email,
    required this.password,
    required this.mykey,
  }) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
        onPressed: () {
          setState(
            () {
              if (widget.mykey.currentState!.validate()) {
                if (widget.email.text.trim().toLowerCase().isNotEmpty &&
                    widget.password.text.trim().isNotEmpty) {
                  myprovider.SignIn(
                          email: " ${widget.email.text}",
                          password: "${widget.password.text}")
                      .whenComplete(
                    () {
                      if (myprovider.status) {
                        myprovider.SignInAdmin(
                                email: " ${widget.email.text}",
                                password: "${widget.password.text}")
                            .whenComplete(
                          () {
                            if (myprovider.status) {
                              _showDialog(
                                  context, "${myprovider.data['message']}");
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllUserScreen(),
                                  ));
                            }
                          },
                        );
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      }
                    },
                  );
                }
              }
            },
          );
        },
        child: const Text(
          "Sign in",
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
