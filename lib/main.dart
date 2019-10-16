import 'package:flutter/material.dart';
import 'package:flutter_app/routes/router.dart';

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
//        //注册路由表
//        routes:{
//          "new_page":(context)=>NewRoute(),
//          "/":(context)=> MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
//        }
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



//  void _onItemClick(BuildContext context,int index){
//    Navigator.of(context).push(
//      new MaterialPageRoute(builder: null)
//    )
//  }
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
      body: Center(
        child: ListView2()
      ),
    );
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

  Widget buildItem(BuildContext buildContext,int index){
    return new GestureDetector(
      onTap: (){
        Navigator.push(buildContext,
            MaterialPageRoute(builder: (buildContext){
              return new NewRoute();
            }));
        NewRoute();
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
