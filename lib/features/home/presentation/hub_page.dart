import 'package:flutter/material.dart';
import 'package:hub/utils/pallet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowHubPage extends StatefulWidget {
  @override
  _ShowHubPageState createState() => _ShowHubPageState();
}

class _ShowHubPageState extends State<ShowHubPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Pallet.bgColor,
            body: Container(
                padding: EdgeInsets.only(top:20.h, right: 20.w, left:20.w),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),
                        Text('Hub', style:TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700)),
                        hubTopWidget(Colors.blue),
                        SizedBox(height: 10.h,),
                        hubTopWidget(Colors.red),

                      ]),
                ))));
  }


  Widget hubTopWidget (Color color){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h,),
        Text('Wichtige Grundlagen', style:TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400, color:Colors.grey)),
        SizedBox(height: 10.h,),
        Wrap(
          children: [
            singleIconWidget(Icons.credit_card_outlined, "Cards", color),
            singleIconWidget(Icons.money, "Payment", color),
            singleIconWidget(Icons.file_present, "Documents", color),
            singleIconWidget(Icons.account_balance_wallet_outlined, "Wallet",color),
            singleIconWidget(Icons.location_on_outlined, "Location",color),
            singleIconWidget(Icons.wifi, "Lounges",color),
            singleIconWidget(Icons.sticky_note_2, "Tickets",color),

          ],
        )
      ],
    );
  }

Widget singleIconWidget(IconData icon, String title, Color color){
    return Container(
      margin: EdgeInsets.only(right: 20.w, top: 10.h, bottom: 10.h),
      child: Column(
        children: [
          Container(
            height: 60.h,

            padding:EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color,
            ),
            child: Icon(icon, color:Pallet.white,size: 30, ),
          ),
          SizedBox(height: 5.h,),
          Text(title)
        ],
      ),
    );
}

}
