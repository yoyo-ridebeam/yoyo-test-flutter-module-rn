import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo (github version)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _data1 = '';
  static const platform = MethodChannel('samples.flutter.dev/yoyochannel');

  void _getDataFromReact() async {
    try {
      setState(() {
        _data1 = 'going';
      });
      final String result =
          await platform.invokeMethod('getData1', {'intData': '199', 'stringData': 'string data from flutter'});

      setState(() {
        _data1 = 'getData1 result $result .';
      });
    } on PlatformException catch (e) {
      setState(() {
        _data1 = "Failed to getData1: '${e.message}'.";
      });
    }
  }

  void _invokeFunctionFromReact() async {
    try {
      final String result =
          await platform.invokeMethod('call-func', {'intData': '199', 'stringData': 'data from flutter'});

      setState(() {
        _data1 = 'getData1 result $result .';
      });
    } on PlatformException catch (e) {
      setState(() {
        _data1 = "Failed to getData1: '${e.message}'.";
      });
    }
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
            ElevatedButton(onPressed: _getDataFromReact, child: const Text('getData1')),
            ElevatedButton(onPressed: _invokeFunctionFromReact, child: const Text('Emit event to react native')),
            Text(
              'data1 $_data1',
            ),
          ],
        ),
      ),
    );
  }
}
