import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingAndMargin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("padding_margin"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            //上下左右都添加10像素补白
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text("hello world"),
          ),
          Container(
            height: 50,
            //右边和顶部添加10像素补白
            padding: EdgeInsets.only(right:10,top: 10),
            color: Colors.blue,
            child: Text("hello world"),
          ),
          Container(
            height: 50,
            //左右边添加10像素补白
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.blue,
            child: Text("hello world"),
          ),
          Container(
            height: 50,
            //上下左右添加10像素补白，外部
            margin: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text("hello world"),
          )
        ],
      ),
    );
  }
  
}