// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:peport_app/models/provider.dart';
import 'package:intl/intl.dart';
import 'package:peport_app/screen/user/edit_report.dart';
import 'package:peport_app/screen/user/home-screen.dart';
import 'package:provider/provider.dart';

class ReportDetailsScreen extends StatefulWidget {
  List list;
  int index;
  ReportDetailsScreen({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(" ${widget.list[widget.index]['title']}"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 30,
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                " ${widget.list[widget.index]['report']}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              "Created at : ${DateFormat.yMMMMEEEEd().format(DateTime.parse(widget.list[widget.index]['created_at']))}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              "Updated at : ${DateFormat.yMMMMEEEEd().format(DateTime.parse(widget.list[widget.index]['updated_at']))}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 5.0),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => const EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                  child: Text('Edit'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditReportScreen(
                            list: widget.list, index: widget.index),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 5.0),
                    padding: MaterialStateProperty.resolveWith(
                        (states) => const EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                  child: Text('Delete'),
                  onPressed: () {
                    myprovider.DeleteReport(
                        id: widget.list[widget.index]['id']);

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                        (route) => false);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
