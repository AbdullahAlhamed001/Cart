import 'package:electronic/widget/Header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:electronic/providers/styleFile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.watch<SyleFile>().maincolor,
        appBar: appbarBoot(context),
        drawer: drawerBoot(context),
        body: Column(
          children: [
            headerLine(context),
            const SizedBox(
              height: 20,
            ),
            components(context)
          ],
        ));
  }
}
