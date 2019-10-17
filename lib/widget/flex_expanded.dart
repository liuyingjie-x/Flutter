import 'package:flutter/material.dart';

class FlexAndExpanded extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("flex"),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}

