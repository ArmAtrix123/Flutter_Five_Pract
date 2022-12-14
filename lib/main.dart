import 'package:flutter/material.dart';
import 'package:flutter_app_obasnenie5pr/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late SharedPreferences _sharedPreferences;
  Future<void> initShared() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _counter = _sharedPreferences.getInt("countet") ?? 0;
    });
  }

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('countet', _counter);
  }

  _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('countet');
    setState(() {
      _counter = 0;
    });
  }

  @override
  void initState() {
    initShared();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    _sharedPreferences.setInt("countet", _counter);
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
            const Text(
              'Тыкни на кнопочку снизу',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Screen1(count: _counter),
                        settings: RouteSettings(arguments: _counter)),
                  );
                },
                child: Text("Перейти на 2 экран")),
            ElevatedButton(onPressed: _saveData, child: const Icon(Icons.save)),
            ElevatedButton(
                onPressed: _clearData, child: const Icon(Icons.clear)),
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
