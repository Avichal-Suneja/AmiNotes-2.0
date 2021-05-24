import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// LOADING SCREEN USING FLUTTER SPIN KIT
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      child: Center(
        child: SpinKitHourGlass(
          color: Colors.teal[200],
          size: 100.0,
        ),
      ),
    );
  }
}
