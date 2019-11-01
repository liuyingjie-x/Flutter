import 'package:flutter/material.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("打开提示页"),
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TipRoute(
                  text: "我是提示XXX",
                );
              },
            ),
          );
          print("路由返回值：$result");
        },
      ),
    );
  }
}

///*路由传值测试*///
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'firstRoute',
      routes: {
        "second_page":(context)=>SecondPage(),
        'third_page':(context)=>ThirdPage()
      },
      home: _FirstPage(),
    );
  }
}

class _FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstPageState();
  }
}

class _FirstPageState extends State<_FirstPage> {
  String _msg='';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('firstPageState'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('go to second activity'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage())),
            ),
            RaisedButton(
              child: Text('go to startActivityForResult'),
              onPressed: ()=>Navigator.pushNamed(context, 'third_page',arguments: '我是第一个页面的').then((msg){
                setState(() {
                  _msg=msg;
                });
              }),
            ),
            Text('Message from Second screen: $_msg'),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('secondPage'),
      ),
      body: RaisedButton(
        child: Text('back to firstPage'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String msg =ModalRoute.of(context).settings.arguments as String;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('thirdPage'),
      ),
      body: RaisedButton(
        child: Text('Message from first screen:$msg'),
        onPressed: ()=>Navigator.pop(context, '我是第三个页面的数据'),
      ),
    );
  }

}
