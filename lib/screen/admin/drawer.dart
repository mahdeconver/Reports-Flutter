import 'package:flutter/material.dart';

import '../../widgets/drawer_list_item_admin.dart';
import '../../widgets/header-drawer_admin.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderDrawerAdminWidget(),
            DrawerListItemAdminWidget(),
          ],
        ),
      ),
    );
  }
}
