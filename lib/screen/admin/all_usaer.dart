import 'package:flutter/material.dart';
import 'package:peport_app/screen/admin/report_of_user.dart';
import 'package:peport_app/screen/user/report_add.dart';
import 'package:provider/provider.dart';
import '../../models/provider.dart';
import 'drawer.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({super.key});

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllUserScreen> {
  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('all User'),
        ),
        drawer: const DrawerScreen(),
        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.add),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => ReportAddScreen(),
        //     ));
        //   },
        // ),
        body: SafeArea(
          child: FutureBuilder<dynamic>(
            future: myprovider.ProfileAllUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  // ignore: unnecessary_null_comparison
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: (() => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => ReportOfUserScreen(
                                    list: snapshot.data, index: index),
                              ),
                            )),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text('${snapshot.data[index]['name']}',
                                style: Theme.of(context).textTheme.headline6),
                            leading: const Icon(Icons.person, size: 40),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
