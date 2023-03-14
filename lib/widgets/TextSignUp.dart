import 'package:flutter/material.dart';
import 'package:peport_app/screen/user/create_new_user.dart';

class TextSignUp extends StatelessWidget {
  final String text;
  final String checkontext;
  final Widget screen;

  const TextSignUp({super.key, required this.text, required this.checkontext, required this.screen});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SignText(
          title: text,
          fontWeight: FontWeight.w500,
        ),
        InkWell(
          onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => screen,
              )),
          child: SignText(
            title: checkontext,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Text SignText({required String title, required FontWeight fontWeight}) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: fontWeight,
      ),
    );
  }
}
