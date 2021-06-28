import 'package:flutter/material.dart';
import 'package:hub/features/home/presentation/homepage.dart';

import 'create_nfc/presentation/create_nfc_page.dart';


class SelectTypePage extends StatelessWidget {
  const SelectTypePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(child:Text('HomePage'), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>
                HomePage()));
              }),
              SizedBox(height: 20,),
              RaisedButton(child:Text('Create NFC'),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>
                    CreateNfcPage()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
