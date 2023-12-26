
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/methods/darken_and_lighten_color.dart';

class ColorWidget extends StatelessWidget {
  ColorWidget({Key? key, required this.color, required this.isSelected, this.height}) : super(key: key);

  bool isSelected= false;
  Color color;
  double ? height;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20.h),
        width: double.infinity,
        height: height,
        color: isSelected? color : darken(color, isSelected? 0 : 0.35),
        child: isSelected ? Container(
          height: 2,
          width: double.infinity,
          decoration:  BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: lighten(color, 0.1),
                    blurRadius: 50,
                    spreadRadius: 25,
                    offset: Offset(0,0)
                ),
              ]
          ),
        ) : null,
      ),
    );
  }
}
