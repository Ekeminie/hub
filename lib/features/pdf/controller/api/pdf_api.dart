import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';


class PdfApi {
  static Future<File> generateCenteredText(String text) async {

    // final Uint8List fontData = (await rootBundle.load("assets/OpenSans-Regular.ttf")) as Uint8List;
    // final font = await rootBundle.load("assets/fonts/Open-Sans.ttf");
    // final Font ttff = Font.ttf(fontData.buffer.asByteData());
    // final ttf = Font.ttf(font);
    final pdf = Document();

    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(text, style: TextStyle(fontSize:40),)
      ),
    ));


    return saveDocument(name: 'newfile', pdf: pdf);
  }

  static Future<File> saveDocument({
     String name,
     Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}