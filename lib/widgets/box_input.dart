import 'package:flutter/material.dart';
import 'package:peport_app/screen/user/create_new_user.dart';

class BoxInputWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const BoxInputWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return "\t\t\tpleas enter : $title ";
              } 
              
            },
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                icon,
                color: const Color(0xff958b85),
              ),
              hintText: '$hintText',
              hintStyle: const TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
