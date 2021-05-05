import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiakbookapp/src/models/deliverer.dart';
import 'package:tiakbookapp/src/services/deliverer_service.dart';
import 'package:tiakbookapp/src/widgets/deliverer_list.dart';
import 'package:tiakbookapp/src/widgets/nav_menu.dart';

class Explorer extends StatefulWidget {
  @override
  _ExplorerState createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  var delServ = DelivererService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    //Timer(Duration(seconds: 3), slide);
    return StreamProvider<List<Deliverer>>(
      create: (_) => delServ.getDeliverers(),
      initialData: [],
      child: MaterialApp(
        home: Scaffold(
          key: _scaffoldKey,
          endDrawer: NavMenu(),
          appBar: AppBar(
            title: Text("Consulter les livreurs"),
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false)),
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: _openDrawer,
              ),
            ],
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                    child: Image.asset(
                  "assets/images/banner.jpg",
                  width: MediaQuery.of(context).size.width,
                )),
                SizedBox(
                  height: 10,
                ),
                DelivererList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
