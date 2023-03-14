// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peport_app/screen/user/report_details.dart';
import '../../models/provider.dart';
import 'drawer.dart';

class ReportOfUserScreen extends StatefulWidget {
  List list;
  int index;
  ReportOfUserScreen({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);
  @override
  State<ReportOfUserScreen> createState() => _ReportOfUserScreenState();
}

class _ReportOfUserScreenState extends State<ReportOfUserScreen> {
  // var time = DateTime.now();

  // var time2 = DateTime.tuesday;

  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('all Repost'),
        ),
        drawer: const DrawerScreen(),
        body: SafeArea(
          child: FutureBuilder<dynamic>(
            future: myprovider.SingleUserDataGet(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ItemList(list: snapshot.data);
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

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  List list;

  ItemList({super.key, required this.list});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        // ignore: unnecessary_null_comparison
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (() => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ReportDetailsScreen(list: list, index: index),
                    ),
                  )),
              child: Card(
                elevation: 3,
                child: ListTile(
                  title: Text("${list[index]['title']}"),
                  leading: const Icon(Icons.text_snippet_rounded, size: 40),
                  subtitle: Text("report : ${list[index]['report']}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// ElevatedButton(
//                 onPressed: () {
//                   if (time.weekday == time2) {
//                     return print("");
//                   }
//                 },
//                 child: const Text("chick")),