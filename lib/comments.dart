import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getComments extends StatefulWidget {
  const getComments({Key? key}) : super(key: key);

  @override
  State<getComments> createState() => _getCommentsState();
}

class _getCommentsState extends State<getComments> {
  List _get = [];

  Future _getDataMhs() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
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
        title: Text('Comments'),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(_get[index]['postId'].toString()),
                  subtitle: Text(_get[index]['name'].toString()));
            }),
      ),
    );
  }
}
