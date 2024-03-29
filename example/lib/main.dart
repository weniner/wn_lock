import 'package:flutter/material.dart';
import 'package:wn_lock/wn_lock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LockController _lockController;

  @override
  void initState() {
    super.initState();
    _lockController = LockController();
    _lockController.addListener(_lockListener);
  }

  @override
  void dispose() {
    super.dispose();
    _lockController.removeListener(_lockListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WNLockWidget(
          lineColor: Colors.redAccent,
          lineWidth: 2,
          attr: HeartAttr(color: Colors.lightGreen, width: 2),
          // attr: CircleAttr(radius: 20, color: Colors.green, width: 2),
          // attr: SquareAttr(length: 20, color: Colors.greenAccent, width: 2),
          controller: _lockController,
          width: 300,
          height: 400,
          row: 7,
          column: 5,
        ),
      ),
    );
  }

  void _lockListener() {
    print('${_lockController.value.offsets}');
  }
}
