import 'package:flutter/material.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';
import 'package:provider/provider.dart';
import 'package:tiakbookapp/src/utils/mediaqueries.dart';
import 'package:tiakbookapp/src/widgets/deliverer_card.dart';

class DelivererList extends StatelessWidget {
  Widget build(BuildContext context) {
    var list = context.watch<List<Deliverer>>();
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(5),
      child: ListView.separated(
          itemBuilder: (context, index) => DelivererCard(del: list[index]),
          separatorBuilder: (context, index) => SizedBox(
                height: vh(context, .01),
              ),
          itemCount: list.length),
    ));
  }
}
