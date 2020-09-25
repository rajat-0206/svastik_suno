import 'package:flutter/material.dart';
import 'package:svastik_suno/core/const.dart';
import 'package:svastik_suno/widget/custombutton.dart';

class CustomProgress extends StatefulWidget {
  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: 50,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "data",
                      style: TextStyle(color: AppColors.styleColor),
                    ),
                    Text(
                      "data",
                      style: TextStyle(color: AppColors.styleColor),
                    )
                  ],
                ),
              ),
            ),
            _mainProgress(width),
            progressMain(width),
            Container(
              height: 50,
              width: width,
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  CustomButton(
                    child: Icon(Icons.fiber_manual_record,
                        size: 20, color: AppColors.darkBlue),
                    size: 30,
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget progressMain(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          height: 5,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            border: Border.all(
              width: 5,
              color: AppColors.styleColor.withAlpha(90),
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          )),
    );
  }

  Widget _mainProgress(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          height: 5,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            border: Border.all(
              width: 5,
              color: AppColors.styleColor.withAlpha(90),
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: AppColors.styleColor.withAlpha(90),
                offset: Offset(1, -1),
                spreadRadius: 1,
                blurRadius: 1,
              )
            ],
          )),
    );
  }
}
