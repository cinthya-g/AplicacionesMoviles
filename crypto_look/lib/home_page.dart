import 'dart:convert'; // PARA HACER CONVERSIONES DE JSON

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/constants.dart';

class HomePage extends StatefulWidget {
  var exchanges = jsonDecode(CRYPTO_EXCHANGES);

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto APP"),
      ),
      body: ListView.separated(
        //tratar la conversión de json como una lista (array) para trabajr con sus indexes
        itemCount: (widget.exchanges as List).length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              widget.exchanges[index]['name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              "${widget.exchanges[index]['country']} \n${widget.exchanges[index]['year_established']}",
            ),
            leading: Image.network(
              widget.exchanges[index]['image'],
              width: 50,
              height: 50,
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
                widget.exchanges[index]['trust_score'].toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
