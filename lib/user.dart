import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getUser extends StatefulWidget {
  const getUser({Key? key}) : super(key: key);

  @override
  State<getUser> createState() => _getUserState();
}

class _getUserState extends State<getUser> {
  List _get = [];

  Future _getDataMhs() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get = data;
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    _getDataMhs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      title: Text(_get[index]['Id'].toString()),
                      subtitle: Text(_get[index]['name'].toString())));
            }),
      ),
    );
  }
}
