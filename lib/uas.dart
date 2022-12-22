import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72200425/main.dart';
import 'package:uas_frontend_gs2223_72200425/uas.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const uas(title: 'Flutter Demo Home Page'),
    );
  }
}

class uas extends StatefulWidget {
  const uas({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<uas> createState() => _uasState();
}

class _uasState extends State<uas> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: new InputDecoration(
                  labelText: "Tes Input",
                  hintText: "Teks yang",
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            ElevatedButton(
              child: Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Tombol Simpan Ditekan");
              },
            ),
            ElevatedButton(
              child: Text(
                "Logout ",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_logout", 0);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => MyHomePage(
                            title: "Flutter Demo Home Page Buatan Sendiri"))));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
