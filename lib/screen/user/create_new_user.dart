import 'package:flutter/material.dart';
import 'package:peport_app/screen/login.dart';
import 'package:peport_app/screen/user/home-screen.dart';
import 'package:peport_app/widgets/register_button_user.dart';

import 'package:provider/provider.dart';

import '../../models/provider.dart';
import '../../widgets/TextSignUp.dart';
import '../../widgets/box_input.dart';

// ignore: must_be_immutable
class CreateNewUserScreen extends StatelessWidget {
  final myKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _address = TextEditingController();

  CreateNewUserScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFFFFFE),
                  Color(0xff958b85),
                ],
              ),
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 120,
              ),
              child: Form(
                key: myKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Register",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    BoxInputWidget(
                      title: "Name",
                      icon: Icons.person,
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                      obscureText: false,
                      controller: _name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BoxInputWidget(
                      title: "Email",
                      icon: Icons.email,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      controller: _email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BoxInputWidget(
                      title: "Address",
                      icon: Icons.place,
                      hintText: 'Address',
                      keyboardType: TextInputType.streetAddress,
                      obscureText: false,
                      controller: _address,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BoxInputWidget(
                      title: "Password",
                      icon: Icons.lock,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _password,
                    ),
                    RegisterButtonUser(
                      mykey: myKey,
                      name: _name,
                      email: _email,
                      address: _address,
                      password: _password,
                      
                    ),
                    TextSignUp(
                        text: "Don't have an Account? ",
                        checkontext: "Sign Up",
                        screen: LoginScreen()),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

 
}
