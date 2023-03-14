import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/provider.dart';

class HeaderDrawerAdminWidget extends StatelessWidget {
  const HeaderDrawerAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context);

    return SafeArea(
        child: Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      color: const Color(0xff4e4b8b),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/p.jpg'),
              ),
            ),
          ),
          Text('Admin', style: Theme.of(context).textTheme.headline4),
          const Divider(
            height: 1,
          ),
        ],
      ),
    ));
  }
}
