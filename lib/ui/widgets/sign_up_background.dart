import 'package:flutter/material.dart';
import 'package:mobx_module/constants/app_theme.dart';
import 'package:mobx_module/ui/clippers/arc_clipper.dart';

class SignUpBackground extends StatelessWidget {
  final showIcon;
  final image;

  SignUpBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    return new Flexible(
      flex: 2,
      child: ClipPath(
        clipper: new ArcClipper(),
        child: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    colors: AppColors.gradientsColorSignUp,
                  )),
            ),
            showIcon
                ? new Center(child: Text('Qarmatek', style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
                color: Colors.black45)),
            ): new Container()
          ],
        ),
      ),
    );
  }

  final bottomHalf = new Flexible(
    flex: 3,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
