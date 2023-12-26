import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_light/app/view/screens/separated_traffic_light.dart';

import '../widgets/color_widget.dart';

class PoliceLightScreen extends StatefulWidget {
  PoliceLightScreen({Key? key}) : super(key: key);

  @override
  State<PoliceLightScreen> createState() => _PoliceLightScreenState();
}

class _PoliceLightScreenState extends State<PoliceLightScreen> {

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              ColorWidget(
                color: Colors.red,
                isSelected: _isColorsVisible ? (_isRed ? true : false) : false,
                height: 120.h,
              ),
              ColorWidget(
                color: Colors.blueAccent,
                isSelected: _isColorsVisible ? (_isRed ? false : true) : false,
                height: 120.h,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (_isColorsVisible) {
                stopTimer();
              } else {
                run();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                _isColorsVisible ? 'Stop' : 'Start',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isRed = true;
  bool _isColorsVisible = false;
  late Timer timer;

  void run() {
    setState(() {
      _isColorsVisible = true;
      _isRed = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _isRed = !_isRed;
      });
    });
  }

  void stopTimer() {
    setState(() {
      timer.cancel();
      _isColorsVisible = false;
    });
  }
}
