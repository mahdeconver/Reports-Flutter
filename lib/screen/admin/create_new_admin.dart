import 'package:flutter/material.dart';
import 'package:peport_app/screen/admin/drawer.dart';
import 'package:peport_app/screen/login.dart';
import 'package:peport_app/widgets/register_button_admin.dart';
import '../../widgets/TextSignUp.dart';
import '../../widgets/box_input.dart';

// ignore: must_be_immutable
class CreateNewAdminScreen extends StatelessWidget {
  final myKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _address = TextEditingController();

  CreateNewAdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Admin'),
      ),
      drawer: DrawerScreen(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 120,
            ),
            child: Form(
              key: myKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                  RegisterButtonAdmin(
                    mykey: myKey,
                    name: _name,
                    email: _email,
                    address: _address,
                    password: _password,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
