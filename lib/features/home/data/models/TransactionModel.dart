import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';


 const String date = '2021-06-23T02:33:14.000000Z';
const String date_one = '2021-06-10T02:33:14.000000Z';
const String date_two = '2021-06-11T02:33:14.000000Z';
const String date_three = '2021-11-23T02:33:14.000000Z';
const String date_four = '2021-06-11T02:33:14.000000Z';
const String date_five = '2021-06-10T02:33:14.000000Z';
const String date_six = '2021-06-15T02:33:14.000000Z';
class TransactionModel {
 Rx<bool> isSelected = false.obs;
  String totalPrice;
  String title;
  List<SingleTransactionItem> singleTransactions;

  TransactionModel({this.title, this.totalPrice, this.singleTransactions, this.isSelected});
}

class SingleTransactionItem {
  String title;
  String subTitle;
  String price;
  String icon;
  String date;
  double amount;
  bool isSelected = false;

  SingleTransactionItem({this.title, this.subTitle, this.price, this.icon, this.amount, this.date, this.isSelected = false});

  SingleTransactionItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        subTitle = json['subtitle'],
  price= json['price'],
  date = json['date'],
  amount = json['amount'];


  Map<String, dynamic> toJson() => {
    'title':title,
    'subtitle':subTitle,
    'price':price,
    'date':date,
    'amount':amount
  };
}


List<SingleTransactionItem> mockData(){
  return [
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "200",
      amount: 200.0,
      date: date_one
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "300",
        amount: 300.0,
        date: date_two
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "400",
        amount: 400.0,
        date: date_two
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_three
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_three
    ), SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_three
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_four
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_four
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500,
        date: date_four
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_four
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500,
        date: date_five
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_five
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500,
        date: date_five
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_five
    ),
    SingleTransactionItem(
        title: "An Amazon Digital Germany Gmbg",
        subTitle: "Heute fallig",
        price: "500",
        amount: 500.0,
        date: date_five
    ),

  ];
    //..sort((a, b) => a.date.compareTo(b.date));
}
List<TransactionModel> getTransactionModel() {
  return [
    TransactionModel(
      isSelected: false.obs,
        title:date,
        totalPrice: "600",
        singleTransactions: [
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "22/6/2021 Heute fallig",
              price: "200"),
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "22/6/2021 Heute fallig",
              price: "200"),
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "22/6/2021 Heute fallig",
              price: "200")
        ]),
    TransactionModel(
        isSelected: false.obs,
        title: date,
        totalPrice: "200",
        singleTransactions: [
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "12/3/2021 Heute fallig",
              price: "200"),
        ]),
    TransactionModel(
        isSelected: false.obs,
        title: date,
        totalPrice: "700",
        singleTransactions: [
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "12/3/2021 Heute fallig",
              price: "300"),
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "Heute fallig",
              price: "200"),
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "12/3/2021 Heute fallig",
              price: "200")
        ]),
    TransactionModel(
        isSelected: false.obs,
        title: date,
        totalPrice: "400",
        singleTransactions: [
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "10/5/2021 Heute fallig",
              price: "200"),
          SingleTransactionItem(
              title: "An Amazon Digital Germany Gmbg",
              subTitle: "12/3/2021 Heute fallig",
              price: "200"),
        ]),
  ];
}
