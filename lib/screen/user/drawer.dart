import 'package:flutter/material.dart';

import '../../widgets/drawer_list_item_user.dart';
import '../../widgets/header-drawer_user.dart';



class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: const [
              HeaderDrawerUserWidget(),
              DrawerListItemUserWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
