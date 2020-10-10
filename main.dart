import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:venus/simple_bar_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MainPage(),
        '/subpage': (BuildContext context) => new SubPage()
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

// class MainPage extends StatelessWidget {
// class MainPage extends StatefulWidget {
class _MainPage extends State<MainPage> {
  Widget chartContainer = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Text('Chart Viewer')],
  );

  String _defaultValue = '新しい順';
  List<String> _list = <String>['新しい順', '古い順', '優先度が高い順', '優先度が低い順'];
  String _text = '';

  void _handleChange(String newValue) {
    setState(() {
      _text = newValue;
      _defaultValue = newValue;
    });
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.note_add),
        // key: _drawerKey, // assign key to Scaffold
        // drawer: Drawer(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => _drawerKey.currentState.openDrawer(), // open drawer
        // ),
        title: const Text('作成'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text('ホーム'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: const Text('設定'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Navigator'),
      ),
      drawerEdgeDragWidth: 0,
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text('目標一覧'),
            onTap: () {},
          ),
          new ListTile(
            title: new Text('ご褒美一覧'),
            onTap: () {},
          ),
          new ListTile(
            title: new Text('ヒント'),
            onTap: () {},
          ),
        ],
      )),
      body: new Container(
        // height: 1000,
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Container(
                height: 250,
                child: chartContainer,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Bar Charts'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Simple'),
                    onPressed: () {
                      setState(() {
                        chartContainer = SimpleBarChart.withSampleData();
                      });
                    },
                  ),
                ],
              ),
              Text(
                "$_text",
                //flutter_chartのインポートが原因でTextStyleがエラーになるため一時コメントアウト
                // style: TextStyle(
                //     color: Colors.blueAccent,
                //     fontSize: 30.0,
                //     fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                value: _defaultValue,
                onChanged: _handleChange,
                items: _list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text('目標一覧'),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed("/subpage"),
                child: new Text('３km走る'),
              ),
              // RaisedButton(
              //   onPressed: () => Navigator.of(context).pushNamed("/subpage"),
              //   child: new Text('５時間勉強する'),
              // ),
              // RaisedButton(
              //   onPressed: () => Navigator.of(context).pushNamed("/subpage"),
              //   child: new Text('１時間筋トレする'),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          // 現在のページインデックス
          // currentIndex: _screen,
          // // onTapでナビゲーションメニューがタップされた時の処理を定義
          // onTap: (index) {
          //   setState(() {
          //     // ページインデックスを更新
          //     _screen = index;

          //     // ページ遷移を定義。
          //     // curveで指定できるのは以下
          //     // https://api.flutter.dev/flutter/animation/Curves-class.html
          //     _pageController.animateToPage(index,
          //         duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          //   });
          // },
          //   onTap: {
          //     return new Scaffold(
          // drawer: new Drawer(
          //     child: new ListView(
          //   children: <Widget>[
          //     new ListTile(
          //       title: new Text('目標一覧'),
          //       onTap: () {},
          //     ),
          //     new ListTile(
          //       title: new Text('ご褒美一覧'),
          //       onTap: () {},
          //     ),
          //     new ListTile(
          //       title: new Text('ヒント'),
          //       onTap: () {},
          //     ),
          //   ],
          // )),
          //     )
          //   }
          // 定義済のナビゲーションメニューのアイテムリスト
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add),
              // key: _drawerKey, // assign key to Scaffold
              // drawer: Drawer(),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () => _drawerKey.currentState.openDrawer(), // open drawer
              // ),
              title: const Text('作成'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: const Text('ホーム'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: const Text('設定'),
            ),
          ]),
    );
  }
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Navigator'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Text('Sub'),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('戻る'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
