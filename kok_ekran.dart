import 'package:flutter/material.dart';

import 'mezun_login.dart';

class kokEkran extends StatefulWidget {
  @override
  _kokEkranState createState() => _kokEkranState();
}

class _kokEkranState extends State<kokEkran> {
  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: ThemeData(primaryColor: Colors.indigo, errorColor: Colors.red),
      child: Scaffold(
      appBar: AppBar(
      title: Text(
      "MEZUN TRAKYA",

    ),
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RaisedButton(
          color: Colors.teal,
          child: Text("MEZUN GİRİŞİ"),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => mezunLogin()));
          },
        ),


      ],
    ),
    ),
    ),
    );

  }
}
