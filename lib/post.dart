import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class getPost extends StatefulWidget {
  const getPost({Key? key}) : super(key: key);

  @override
  State<getPost> createState() => _getPostState();
}

class _getPostState extends State<getPost> {
  List _get = [];

  Future _getDataMhs() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
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
        title: Text('Post'),
      ),
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(_get[index]['userId'].toString()),
                  subtitle: Text(_get[index]['title'].toString()));
            }),
      ),
    );
  }
}
