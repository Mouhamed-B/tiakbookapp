import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tiakbookapp/src/widgets/deliverer_list.dart';

class Explorer extends StatefulWidget {
  @override
  _ExplorerState createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  bool _first = true;
  void slide() {
    setState(() {
      _first = !_first;
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), slide);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Explorer")),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            AnimatedCrossFade(
              duration: const Duration(seconds: 2),
              firstChild: Image.asset("images/contact.png"),
              secondChild: Image.asset("images/tiakBook2.png"),
              crossFadeState:
                  _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
            SizedBox(
              height: 10,
            ),
            DelivererList()
          ],
        ),
      ),
    );
  }
}
