

import 'package:flutter/material.dart';
import 'package:hub/features/home/presentation/homepage.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:nfc_manager/nfc_manager.dart';


class CreateNfcPage extends StatefulWidget {
  const CreateNfcPage({Key key}) : super(key: key);

  @override
  _CreateNfcPageState createState() => _CreateNfcPageState();
}

class _CreateNfcPageState extends State<CreateNfcPage> {


  startNFc()async{
    Stream<NDEFMessage> stream = NFC.readNDEF();
    stream.listen((NDEFMessage message) {
      NDEFMessage newMessage = NDEFMessage.withRecords(
          <NDEFRecord>[
            NDEFRecord.plain("test message"),
            NDEFRecord.plain("another test message"),
          ],id: 'test'
      );
      message.tag.write(newMessage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: Container(
          width:double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              RaisedButton(child:Text('start nfc'),onPressed: (){
                startNFc();
              }),
              SizedBox(height: 20,),
              RaisedButton(child:Text('homepage'),onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>
                    HomePage()));
              }),
                       ]
          ),
        )
      )
    );
  }
}
