import 'package:flutter/material.dart';
import 'package:gophr/jobs/jobBoard.dart';
import 'package:gophr/jobs/jobLogic.dart';
import 'package:gophr/ui/components/text_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: gophrTextTheme(),
      ),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Jobs(),
      child: const GophrJobBoard(),
    );
  }
}
