import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class Pdf extends StatefulWidget {
  @override
  _PdfState createState() => _PdfState();
}

class _PdfState extends State<Pdf> {

  // INITIALIZING LOCAL VARIABLES
  Map data;
  String url;
  int index;
  String listText;

  // THE MAIN BUILD FUNCTION
  @override
  Widget build(BuildContext context) {

    // GETTING URL AND OTHER META DATA FROM THE PDF-VIEWER SCREEN TO DISPLAY THE PDF
    data = ModalRoute.of(context).settings.arguments;
    url = data['url'];
    index = data['index'];
    listText = data['listText'];

    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        title: Text(
          data['notes']? listText + (index+1).toString(): 'Sample paper-' + (index+1).toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0
          ),
        ),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.download_rounded, color: Colors.white),
            label: Text(''),
            onPressed: () async {
              await launch(url);
            },
          )
        ],
      ),

      body:SfPdfViewer.network(
        url,
      ),
    );
  }
}
