import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peport_app/screen/user/drawer.dart';
import 'package:provider/provider.dart';

import '../../models/provider.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      drawer: const DrawerScreen(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  var data =
                      await myprovider.AllReportGet().catchError((ex) {});
                  if (data == null) {
                    return print("error");
                  }
                  debugPrint("$data");
                  //  User acount
                  // var user = userFromJson(data);
                  // debugPrint("user count :"+ user.length.toString());
                },
                child: const Text('get')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                 myprovider.SignIn(email: '6@gmail.com', password: '87654325');
                  if (myprovider.status == true) {
                    // tt(myprovider.data, myprovider.status);
                  } else {
                    print("ggggggggg");
                  }
                },
                child: const Text('ss')),
          ),
        ],
      ),
    );
  }

  void tt(data, status) {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('login failure'),
        content: Text(' ${data['message']}'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (status == true) {
                tt(data, status);
              } else {
                print("yes user is exist");
                Navigator.pop(context);
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
