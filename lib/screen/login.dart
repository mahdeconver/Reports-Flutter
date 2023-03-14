import 'package:flutter/material.dart';
import 'package:peport_app/screen/user/create_new_user.dart';
import '../widgets/TextSignUp.dart';
import '../widgets/box_input.dart';
import '../widgets/login_button.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final myKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  LoginScreen({super.key});
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
                      "Sign in",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(
                      height: 50,
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
                      title: "Password",
                      icon: Icons.lock,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _password,
                    ),
                    LoginButton(
                      mykey: myKey,
                      email: _email,
                      password: _password,
                    ),
                    TextSignUp(
                        text: "Don't have an Account? ",
                        checkontext: "Sign Up",
                        screen: CreateNewUserScreen()),
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
