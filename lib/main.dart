import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72200425/home.dart';
import 'package:uas_frontend_gs2223_72200425/uas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

// void main() {
//   runApp(new MaterialApp(
//     home: new SplashScreen(
//       title: Text('Splash Screen'),
//     ),
//   ));
// }

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new Home(
        title: 'uas',
      ),
      title: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset('image/logo.png'),
      photoSize: 150.0,
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void navigateLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? isLogin = pref.getInt("is_login");
    if (isLogin == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const uas(
                  title: "Halo Push",
                )),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    navigateLogin();
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
            const Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Tes Input",
                  hintText: "Teks yang",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
            ElevatedButton(
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // print("Tombol Simpan Ditekan");
              },
            ),
            ElevatedButton(
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setInt("is_login", 1);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const uas(
                            title: "Halo Push",
                          )),
                );
              },
            )
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
