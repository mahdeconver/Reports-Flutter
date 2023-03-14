import 'package:flutter/material.dart';
import 'package:peport_app/models/provider.dart';
import 'package:peport_app/screen/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => myProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    myProvider myprovider = Provider.of<myProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 29,
                color: Color(0xff1242fe),
                fontWeight: FontWeight.bold,
              ),
              headline2: const TextStyle(
                fontSize: 26,
                color: Color(0xff1242fe),
                fontWeight: FontWeight.bold,
              ),
              headline3: const TextStyle(
                fontSize: 35,
                color: Color(0xff1242fe),
                fontWeight: FontWeight.bold,
              ),
              headline4: const TextStyle(color: Colors.white, fontSize: 20),
              headline5: const TextStyle(color: Colors.white, fontSize: 14),
              headline6: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
