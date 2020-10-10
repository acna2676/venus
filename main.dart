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
        '/subpage': (BuildContext context) => new SubPage(),
        '/complete': (BuildContext context) => new CompletePage(),
        '/incomplete': (BuildContext context) => new IncompletePage(),
        '/create': (BuildContext context) => new CreatePage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

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

  int _currentIndex = 0;

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.note_add),
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
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1, // 幅の比率
                    child: Container(
                      height: 150,
                      child: SimpleBarChart.withSampleData(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 150,
                      child: SimpleBarChart.withSampleData(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                "$_text",
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
      ),
    );
  }

  void _onItemTapped(int index) =>
      setState(() => Navigator.of(context).pushNamed("/create"));
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
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('戻る'),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed("/complete"),
                child: new Text('完了'),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed("/incomplete"),
                child: new Text('あきらめる'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CompletePage extends StatelessWidget {
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
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('戻る'),
              ),
              Image.asset('images/celebration.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class IncompletePage extends StatelessWidget {
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
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('戻る'),
              ),
              Image.asset('images/encouragement.png'),
            ],
          ),
        ),
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
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
              Form(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Goal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
