import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub/features/home/data/models/TransactionModel.dart';
class SingleTransactionController extends GetxController{

  Rx<bool> showFab = false.obs;

  RxList<TransactionModel> transactionModel= getTransactionModel().obs;
  RxList<SingleTransactionItem> mockListItem= mockData().obs;





  onStartScroll(ScrollMetrics metrics) {
    print("Scroll Start");
    showFab.value = false;
    mockListItem.forEach((element) {
      element.isSelected = false;
    });
// transactionModel.forEach((element) {
//       element.isSelected = false.obs;
//     });
  }

  changeIsSelectedAtIndex(int position){
    mockListItem.forEach((element) {
      element.isSelected = false;
    });
      mockListItem[position].isSelected = true;
      update();
  }

  onUpdateScroll(ScrollMetrics metrics) {
    print("Scroll Update");
    showFab.value = false;
    mockListItem.forEach((element) {
      element.isSelected = false;
    });
    // transactionModel.forEach((element) {
    //   element.isSelected = false.obs;
    // });
  }

  onEndScroll(ScrollMetrics metrics) {
    print("Scroll End");
    showFab.value = false;
    mockListItem.forEach((element) {
      element.isSelected = false;
    });
    // transactionModel.forEach((element) {
    //   element.isSelected = false.obs;
    // });
  }


}