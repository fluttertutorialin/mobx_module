import 'package:flutter/material.dart';
import 'package:mobx_module/constants/app_theme.dart';

class CustomFloatForm extends StatelessWidget {
  final IconData icon;
  final VoidCallback qrCallback;
  final isMini;

  CustomFloatForm({this.icon, this.qrCallback, this.isMini = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      mini: isMini,
      onPressed: qrCallback,
      child: Ink(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: AppColors.gradientsColorFloatForm)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
