import 'package:flutter/material.dart';
class Logbook extends StatefulWidget {
  const Logbook({Key? key}) : super(key: key);

  @override
  State<Logbook> createState() => _LogbookState();
}

class _LogbookState extends State<Logbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Logbook'),
    );
  }
}
