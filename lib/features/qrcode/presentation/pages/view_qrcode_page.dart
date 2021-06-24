import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ViewQRCodePage extends StatefulWidget {
  final String data;
  ViewQRCodePage({this.data= ""});

  @override
  _ViewQRCodePageState createState() => _ViewQRCodePageState();
}

class _ViewQRCodePageState extends State<ViewQRCodePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:() =>Navigator.pop(context),color: Colors.grey),
          centerTitle: true,
          title: Text("QR Code", style:TextStyle(color:Colors.grey)),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Container(
                padding:EdgeInsets.all(10),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: QrImage(
                  data: widget.data,
                  version: QrVersions.auto,
                  gapless: false,
                  errorStateBuilder: (cxt, err) {
                    return Container(
                      child: Center(
                        child: Text(
                          "Uh oh! Something went wrong...",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h,),
              Text("Scan the Qr-Code to get the receipt for your purchase", style: TextStyle(fontSize: 16.sp),textAlign: TextAlign.center,)
            ],
          )
        ),
      ),
    );
  }
}
