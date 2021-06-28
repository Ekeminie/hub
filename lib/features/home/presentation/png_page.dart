import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hub/utils/pallet.dart';


class ShowPNGPage extends StatefulWidget {
  @override
  _ShowPNGPageState createState() => _ShowPNGPageState();
}

class _ShowPNGPageState extends State<ShowPNGPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Pallet.bgColor,
            body: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text("Show Png Page"))
                    ]))));
  }
}
