

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../helper/constants/app_contstants.dart';

class TrafficLightFullScreen extends StatefulWidget {
  const TrafficLightFullScreen({Key? key}) : super(key: key);

  @override
  State<TrafficLightFullScreen> createState() => _TrafficLightFullScreenState();
}

class _TrafficLightFullScreenState extends State<TrafficLightFullScreen> {

  int selectedIndex=-1;

  List<Color> colors= [Colors.red, Colors.yellow, Colors.green];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              color: selectedIndex==-1 ? Colors.white : colors[selectedIndex],

              child: selectedIndex==-1 ? Text(
                'Press start button to start traffic light',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 28.sp,
                ),
              ) : null,
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 40.0.h),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(selectedIndex==-1){
                      startTimer([AppConstants.redTime, AppConstants.yellowTime, AppConstants.greenTime]);
                    }else{
                      selectedIndex=-1;
                      timer.cancel();
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
                  child: Text(
                    selectedIndex==-1 ? 'Start' : 'Stop',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  late Timer timer;
  FutureOr<void> startTimer(List<int> times) {
    selectedIndex=0;
    int count = times[selectedIndex];

    timer = Timer.periodic(const Duration(seconds: 1), (timer){

      if(selectedIndex!=-1){
        count--;
        print(count);
        if(count==0){
          setState(() {
            if(selectedIndex==2){
              selectedIndex=0;
            }else{
              selectedIndex++;
            }
            count= times[selectedIndex];
          });
        }
      }else{
        timer.cancel();
      }

    });
  }

}
