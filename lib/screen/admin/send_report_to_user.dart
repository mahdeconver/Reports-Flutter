import 'package:flutter/material.dart';

import 'drawer.dart';

class SendRepostScreen extends StatefulWidget {
  @override
  State<SendRepostScreen> createState() => _SendRepostScreenState();
}

class _SendRepostScreenState extends State<SendRepostScreen> {
  var time = DateTime.now();

  var time2 = DateTime.tuesday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send your Repost'),
      ),
      drawer: const DrawerScreen(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (time.weekday == time2) {
              return print("ggggggggggggggggggg");
            }
          },
          child: const Text("chick")),
    );
  }
}
