import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/complete_homepage_demo.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:flutter_app/widget/decoratedbox.dart';
import 'package:flutter_app/widget/flex_expanded.dart';
import 'package:flutter_app/widget/padding_margin.dart';
import 'package:flutter_app/widget/row_column.dart';
import 'package:flutter_app/widget/wrap_flow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == "tip") {
          return MaterialPageRoute(builder: (context) {
            return TipRoute(text: settings.name);
          });
        }
        return null;
      },
      routes: {
        "tip2": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        }, //注册首页路由
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new route"),
      ),
      body: Center(
        child: Text("this is new route"),
      ),
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
  String _batteryLevel = 'Unknown battery level.';
  static const platform = const MethodChannel('samples.flutter.io/battery');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /*  body: Center(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //强制高度为50.0
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            }),
      ),*/
//      body: Center(
//        child: ListView2()
//      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                  return NewRoute();
                }));
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text("布局"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return RowAndColumn();
                    }));
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text("RowAndColumn"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return FlexAndExpanded();
                    }));
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text("FlexAndExpanded"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return WrapAndFlow();
                    }));
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text("wrap_flow"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return PaddingAndMargin();
                    }));
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("padding_margin"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return DecoratedBoxDemo();
                    }));
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("decoratedbox"),
              )
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return ScaffoldDemo();
                    }));
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("homepage_demo"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return FirstRoute();
                    }));
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("测试"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return NewRoute();
                    }));
              },
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Text("测试"),
              )),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (buildContext) {
                      return NewRoute();
                    }));
              },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new RaisedButton(
                  child: new Text('Get Battery Level'),
                  onPressed: _getBatteryLevel,
                ),
                new Text(_batteryLevel),
              ],
            ),
          ),

        ],
      ),
    );
  }
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}

class ListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: buildItem,
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }

  Widget buildItem(BuildContext buildContext, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(buildContext, MaterialPageRoute(builder: (buildContext) {
          return NewRoute();
        }));
      },
      child: Container(
        child: Text("测试点击"),
        height: 50,
        alignment: Alignment.center,
      ),
    );
//    return new Text("测试点击");
  }
}

class PageState extends State<MyHomePage> {

  static const platform = const MethodChannel('samples.flutter.io/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("channel"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new RaisedButton(
              child: new Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}

class testState extends State{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}