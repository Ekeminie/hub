import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qr_flutter/qr_flutter.dart';

class ViewPdfPage extends StatefulWidget {
  final PDFDocument document;
  ViewPdfPage({this.document});


  @override
  _ViewPdfPageState createState() => _ViewPdfPageState();
}

class _ViewPdfPageState extends State<ViewPdfPage> {
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:() =>Navigator.pop(context),color: Colors.grey),
          centerTitle: true,
          title: Text("Pdf Document", style:TextStyle(color:Colors.grey)),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: PDFViewer(document: widget.document)),

      ),
    );
  }

  @override
  void initState() {
    super.initState();

  }
}


