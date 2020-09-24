import 'package:flutter/material.dart';
import 'package:svastik_suno/core/const.dart';

class CustomButton extends StatelessWidget {
  final double size;
  final double borderWidth;
  final String image;
  final Widget child;
  final bool isActive;
  final VoidCallback onTap;

  CustomButton(
      {this.child,
      @required this.size,
      @required this.onTap,
      this.image,
      this.borderWidth = 2,
      this.isActive = false});
  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(200),
      ),
      border: Border.all(
          width: borderWidth,
          color: isActive ? AppColors.darkBlue : AppColors.mainColor),
      boxShadow: [
        BoxShadow(
          color: AppColors.lightBlueShadow,
          blurRadius: 10,
          offset: Offset(5, 5),
          spreadRadius: 3,
        ),
        BoxShadow(
          color: Colors.white38,
          blurRadius: 5,
          offset: Offset(-5, -5),
          spreadRadius: 3,
        )
      ],
    );
    if (image != null) {
      boxDecoration = boxDecoration.copyWith(
        image: DecorationImage(
          image: ExactAssetImage(image),
          fit: BoxFit.cover,
        ),
      );
    }
    if (isActive) {
      boxDecoration = boxDecoration.copyWith(
          gradient: RadialGradient(colors: [
        AppColors.lightBlue,
        AppColors.darkBlue,
      ]));
    } else {
      boxDecoration = boxDecoration.copyWith(
          gradient: RadialGradient(colors: [
        AppColors.mainColor,
        AppColors.mainColor,
        AppColors.mainColor,
        Colors.white,
      ]));
    }
    return Container(
      height: size,
      width: size,
      decoration: boxDecoration,
      child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: onTap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(200))),
          child: child ?? Container()),
    );
  }
}
