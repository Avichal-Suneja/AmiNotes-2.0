import 'package:aminotes2/pages/Home.dart';
import 'package:aminotes2/pages/Pdf.dart';
import 'package:aminotes2/pages/PdfViewer.dart';
import 'package:aminotes2/pages/Subjects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  // Initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Home(),
    routes: {
      '/home' : (context) => Home(),
      '/subjects' : (context) => Subjects(),
      '/pdfViewer' : (context) => PdfViewer(),
      '/pdf' : (context) => Pdf(),
    },
  ));

}
