import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("横竖布局"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text("hello"),
          Text("welcome"),
          Text("to"),
          Text("flutter"),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello"),
              Text("welcome"),
              Text("to"),
              Text("newyork"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("hello"),
              Text("welcome"),
              Text("to"),
              Text("newyork"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("hello",style: TextStyle(fontSize:20),),
              Text("welcome"),
              Text("to"),
              Text("newyork"),
            ],

          )
        ],
      ),
    );
  }
}
