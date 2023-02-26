import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoolWidget extends StatefulWidget {
  const BoolWidget({super.key});

  @override
  _BoolWidgetState createState() => _BoolWidgetState();
}

class _BoolWidgetState extends State<BoolWidget> {

  Future<bool> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:5000/searchUser'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Impossible de récupérer le booléen depuis le backend');
    }
  }


  late bool _myBool;


  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        _myBool = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_myBool == true) {
      return MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              Card(
              elevation: 20,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black,width: 4),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:  const <Widget>[
                    ListTile(
                      leading: Icon(Icons.history_toggle_off,size: (50),),
                      title: Text('Bienvenue Fama'),
                      subtitle: Text('Vous avez ete reconnu'),
                    ),]),
              )
            ],
          ),
        ),
      );}
    else {
      return Card(
        elevation: 20,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black,width: 4),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children:  const <Widget>[
              ListTile(
                leading: Icon(Icons.history_toggle_off,size: (50),),
                title: Text('Vous n\'etes pas dans notre base de donnee'),
              ),]),
      );
    }
  }


}







