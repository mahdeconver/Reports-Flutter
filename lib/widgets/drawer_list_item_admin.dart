import 'package:flutter/material.dart';
import 'package:peport_app/screen/login.dart';
import 'package:peport_app/screen/user/taske.dart';
import 'package:provider/provider.dart';
import '../models/provider.dart';
import '../screen/admin/all_usaer.dart';
import '../screen/admin/create_new_admin.dart';
import '../screen/user/send_report_to_admin.dart';

class DrawerListItemAdminWidget extends StatelessWidget {
  const DrawerListItemAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context);

    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          MenuItem(
            context: context,
            iconData: Icons.dashboard_outlined,
            textItem: 'My Reports',
            Screen: AllUserScreen(),
          ),
          MenuItem(
            context: context,
            iconData: Icons.send,
            textItem: 'Send Report',
            Screen: SendRepostScreen(),
          ),
          MenuItem(
            context: context,
            iconData: Icons.task,
            textItem: 'Tasks',
            Screen: TasksScreen(),
          ),
          MenuItem(
            context: context,
            iconData: Icons.login_outlined,
            textItem: 'Create New Admin',
            Screen: CreateNewAdminScreen(),
          ),
          MenuItem(
            context: context,
            iconData: Icons.login_outlined,
            textItem: 'logout',
            Screen: LoginScreen(),
          ),
        ],
      ),
    );
  }

  InkWell MenuItem({
    required BuildContext context,
    required IconData iconData,
    required String textItem,
    required Widget Screen,
  }) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Screen,
          )),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                iconData,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                textItem,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
