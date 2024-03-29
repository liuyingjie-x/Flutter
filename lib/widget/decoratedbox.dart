import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DecoratedBox"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.red, offset: Offset(2, 2), blurRadius: 5)
                ]),
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "button",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                image: DecorationImage(
                  image: AssetImage("lib/resource/images/android_icon.png"),
                  //alignment: Alignment.topLeft
                ),
              ),
            ),
          ),
          Image(
              height:40,
              width:40,
              image: AssetImage("lib/resource/images/blackman.png"))
        ],
      ),
    );
  }
}
