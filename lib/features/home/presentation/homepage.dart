
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hub/core/ui/widgets/error_widget.dart';
import 'package:hub/core/ui/widgets/toast.dart';
import 'package:hub/features/model/customer.dart';
import 'package:hub/features/model/invoice.dart';
import 'package:hub/features/model/supplier.dart';
import 'package:hub/features/pdf/api/pdf_api.dart';
import 'package:hub/features/pdf/api/pdf_invoice_api.dart';
import 'package:hub/features/pdf/presentation/pages/view_pdf_page.dart';
import 'package:hub/utils/dateutils.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hub/features/home/controller/single_transaction_controller.dart';
import 'package:hub/features/home/data/models/TransactionModel.dart';
import 'package:hub/features/home/presentation/widgets/single_transaction_widget.dart';
import 'package:hub/features/qrcode/presentation/pages/view_qrcode_page.dart';
import 'package:hub/utils/pallet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/nfc_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SingleTransactionController singleTransactionController =
      Get.find<SingleTransactionController>();
  SingleTransactionItem selectedItem;

  final _bloc = NfcBloc();


  @override
  void initState() {
    super.initState();
    tech =  Ndef.from(NfcTag(handle: "test", data: {
    'test':"testing"
    }));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
  var tech;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white
    ));
    print(singleTransactionController.mockListItem.length.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallet.bgColor,
        body: BlocListener(
          bloc:_bloc,
          listener:(context, state){
            if(state is NfcNotSupportedState){
              // return NfcError();
            }
            if(state is NfcSuccessState){
              flutterToast(state.nfcData, false);
            }
          },
          child: Container(
            padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  singleTransactionController
                      .onStartScroll(scrollNotification.metrics);
                  setState(() {});
                } else if (scrollNotification is ScrollUpdateNotification) {
                  singleTransactionController
                      .onUpdateScroll(scrollNotification.metrics);
                  setState(() {});
                } else if (scrollNotification is ScrollEndNotification) {
                  singleTransactionController
                      .onEndScroll(scrollNotification.metrics);
                  setState(() {});
                }
              },
              child: TransactionItemWidget(scanAction: ()async{


                await tech.write(NdefMessage(<NdefRecord>[
                  NdefRecord.createText("test"),
                  NdefRecord.createText("test"),
                ]));

                await NfcManager.instance.startSession(
                  onDiscovered: (NfcTag tag) async {
                    print("discovered");
                  },
                );
                //_bloc.add(StartNFCEvent());
              },selected: (val){

                selectedItem = val;
              },singleTransactionItem: singleTransactionController.mockListItem,),
            ),
          ),
        ),
        floatingActionButton: GetX<SingleTransactionController>(
          builder: (controller) => Visibility(
              visible: controller.showFab.value,
              child: Container(
                  padding: EdgeInsets.all(12),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            if (selectedItem != null) {
                              var expenses;
                                expenses = "\n Title: " +
                                    selectedItem.title +
                                    "\n" +
                                    "Details" +
                                    selectedItem.subTitle +
                                    "\n" +
                                    "Price: " +
                                    "\n" +
                                    selectedItem.price;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ViewQRCodePage(
                                            data:
                                                "${selectedItem.title + "\n" + selectedItem.amount.toString() + "\n \n \n" + expenses}",
                                          )));
                            }
                          },
                          child: FaIcon(FontAwesomeIcons.qrcode,
                              color: Colors.blue)),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(Icons.compare_arrows_outlined, color: Colors.black),
                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                          onTap: () async {
                            if (selectedItem != null) {print('here');
                            // PDFDocument doc = await PDFDocument.fromAsset('assets/images/invoice.pdf');
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => ViewPdfPage(
                            //           document:doc)));
                            final date = DateTime.now();
                            final dueDate = date.add(Duration(days: 7));

                            final invoice = Invoice(
                              supplier: Supplier(
                                name: 'Test User',
                                address: 'Uyo, Nigeria',
                                paymentInfo: 'https://paypal.me/testuser',
                              ),
                              customer: Customer(
                                name: 'Apple Inc.',
                                address: 'Apple Street, Cupertino, CA 95014',
                              ),
                              info: InvoiceInfo(
                                date: date,
                                dueDate: dueDate,
                                description: 'My description...',
                                number: '${DateTime.now().year}-9999',
                              ),
                              items: [
                                InvoiceItem(
                                  description: selectedItem.title,
                                  date:  DateTime.parse(selectedItem.date),
                                  quantity: 3,
                                  vat: 0.19,
                                  unitPrice: 5.99,
                                ),

                              ],
                            );

                            final pdfFile = await PdfInvoiceApi.generate(invoice);
                            PDFDocument doc = await PDFDocument.fromFile(pdfFile);
                           // PdfApi.openFile(pdfFile);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ViewPdfPage(
                                        document:doc)));
                            }
                          },
                          child: FaIcon(FontAwesomeIcons.filePdf,
                              color: Colors.blue)),
                    ],
                  ))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget iconWidget() {
    return Container(
        height: 50.h,
        width: 50.w,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffE4E1E8),
          ),
          child: Center(
            child: Icon(Icons.weekend, color: Color(0xff9797BD)),
          ),
        ));
  }
}
