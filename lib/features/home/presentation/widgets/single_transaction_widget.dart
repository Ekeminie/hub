import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub/features/home/controller/single_transaction_controller.dart';
import 'package:hub/features/home/data/models/TransactionModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hub/utils/dateutils.dart';
import 'package:hub/utils/pallet.dart';

class TransactionItemWidget extends StatefulWidget {
  final List<SingleTransactionItem> singleTransactionItem;
  final ValueChanged<SingleTransactionItem>selected;



  TransactionItemWidget({this.singleTransactionItem, this.selected});

  @override
  _TransactionItemWidgetState createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  ValueChanged<SingleTransactionItem> onSelected;

  SingleTransactionController singleTransactionController =
      Get.find<SingleTransactionController>();


  double sumItemsWithSameDates(String date){
    double amount= 0.0;
    widget.singleTransactionItem.forEach((element) {
      if(element.date==date){
        amount+element.amount;
      }


    });

        return amount;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.w, left: 20.w, top: 10.h, bottom: 10.h),
                child: Container(
                  height: 50.h,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Pallet.cardBgColor,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      suffixIcon:
                      Icon(Icons.filter_list, color: Pallet.primaryBlue),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment:Alignment.topLeft,
              child: Text(
                "Transaktionen",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
           
            Expanded(
              child: ListView.builder(
                  itemCount: widget.singleTransactionItem?.length,
                  itemBuilder: (context, position) => Column(children: [

                    (position == 0)
                        ? Padding(
                      padding:EdgeInsets.only(bottom:20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateUtil.format(DateTime.parse(
                                    widget.singleTransactionItem[position].date)),
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "1000 £",
                                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                              )
                            ],
                          ),
                        )
                        : (DateUtil.format(DateTime.parse(
                        widget.singleTransactionItem[position].date)) !=
                        DateUtil.format(DateTime.parse(
                            widget.singleTransactionItem[position - 1].date)))
                        ? Padding(
                      padding: EdgeInsets.only(top: 20.0.h,bottom:20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateUtil.format(DateTime.parse(
                                widget.singleTransactionItem[position].date)),
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "1000 £",
                            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                          )
                        ],
                      ),
                    )
                        : SizedBox(
                      height: 0,
                    ),


                    Obx(()=>Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(
                            color: singleTransactionController.mockListItem.value[position]
                                ?.isSelected
                                ? Colors.blue
                                : Pallet.bgColor,
                            width: singleTransactionController.mockListItem.value[position]
                                ?.isSelected
                                ? 3.0
                                : 0.0),
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ListTile(
                        onTap: (){
                          singleTransactionController.showFab.value = true;
                          singleTransactionController.changeIsSelectedAtIndex(position);
                          widget.selected(widget.singleTransactionItem[position]);
                          setState(() {});

                        },
                        title: Text(widget.singleTransactionItem[position].title,
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        leading: Container(
                            height: 50.h,
                            width: 50.w,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xffE4E1E8),
                              ),
                              child: Center(
                                child: Icon(Icons.wallet_giftcard_sharp,
                                    color: Pallet.primaryBlue),
                              ),
                            )),
                        subtitle:
                        Text(widget.singleTransactionItem[position].subTitle),
                        trailing: Text(
                            "- ${widget.singleTransactionItem[position].price} £",
                            style: TextStyle(fontWeight: FontWeight.w700)),
                      ),
                    ),
                    )
                  ])),
            )
          ],
        ));
  }
}
