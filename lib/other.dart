import 'package:flutter/material.dart';

class OtherPageArguments {
  final String name;

  OtherPageArguments(this.name);
}

class OtherPage extends StatefulWidget {
  final String title;

  const OtherPage({Key key, this.title}) : super(key: key);

  @override
  OtherPageState createState() {
    return OtherPageState();
  }
}

class OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    OtherPageArguments argument = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Padding(padding: EdgeInsets.all(16),
            child:
            Column(
              children: <Widget>[
                Text("こんにちは、" + argument.name),
              ],
            )
        )
    );
  }
}