// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peport_app/models/provider.dart';

import 'package:peport_app/screen/user/home-screen.dart';
import 'package:provider/provider.dart';

import '../../widgets/box_input.dart';

// ignore: must_be_immutable
class EditReportScreen extends StatefulWidget {
  List list;
  int index;
  EditReportScreen({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);

  @override
  State<EditReportScreen> createState() => _EditReportScreenState();
}

class _EditReportScreenState extends State<EditReportScreen> {
  final myKey = GlobalKey<FormState>();

  late TextEditingController _title;
  late TextEditingController _report;
  @override
  void initState() {
    _title = TextEditingController(text: widget.list[widget.index]['title']);
    _report = TextEditingController(text: widget.list[widget.index]['report']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Details",
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 120,
        ),
        child: Form(
          key: myKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              BoxInputWidget(
                title: "Title",
                icon: Icons.title,
                hintText: 'Title',
                keyboardType: TextInputType.text,
                obscureText: false,
                controller: _title,
              ),
              const SizedBox(
                height: 20,
              ),
              BoxInputWidget(
                title: "Report",
                icon: Icons.task_rounded,
                hintText: 'Report',
                keyboardType: TextInputType.text,
                obscureText: false,
                controller: _report,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                      ),
                      child: Text('Save'),
                      onPressed: () async {
                        setState(() {
                          if (myKey.currentState!.validate()) {
                            if (_title.text.trim().isNotEmpty &&
                                _report.text.trim().isNotEmpty) {
                              myprovider.UpdateReport(
                                  id: widget.list[widget.index]['id'],
                                  title: _title.text,
                                  report: _report.text);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            }
                          }
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
