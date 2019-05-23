import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPageArguments {
  final int id;

  DetailPageArguments(this.id);
}

// 名刺１枚分の情報をAPIから取ってきて表示する
class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  DetailPageState createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  //名刺ID
  int _id;

  //氏名
  String _name;

  //社名
  String _company;

  //所属
  String _division;

  //役職
  String _title;

  @override
  Widget build(BuildContext context) {
    // TODO ネットワークエラー
    return Scaffold(
        appBar: AppBar(title: Text('名刺詳細')),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: makeChildren(),
            )));
  }

  // paddingの中の要素たち
  List<Widget> makeChildren() {
    if (_name == null) {
      // 名刺が無いのでプログレスを表示
      return <Widget>[CircularProgressIndicator()];
    } else {
      // 名刺を表示
      return <Widget>[
        Text(_name),
        Text(_company),
        Text(_division),
        Text(_title),
      ];
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      DetailPageArguments arguments = ModalRoute.of(context).settings.arguments;
      _id = arguments.id;
      loadData();
    });
  }

  // APIから取ってくる
  loadData() async {
    String url = "https://jjsonplaceholder.appspot.com/cards/" + _id.toString();
    http.Response response = await http.get(url);
    var card = json.decode(utf8.decode(response.bodyBytes));
    setState(() {
      _name = card['name'];
      _company = card['company'];
      _division = card['division'];
      _title = card['title'];
    });
  }
}
