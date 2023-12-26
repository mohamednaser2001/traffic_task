


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_light/helper/constants/app_contstants.dart';

import '../widgets/color_widget.dart';

class SeparatedTrafficLightScreen extends StatefulWidget {
  const SeparatedTrafficLightScreen({Key? key}) : super(key: key);

  @override
  State<SeparatedTrafficLightScreen> createState() => _SeparatedTrafficLightScreenState();
}

class _SeparatedTrafficLightScreenState extends State<SeparatedTrafficLightScreen> {


  int selectedIndex=-1;




  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ColorWidget(color: Colors.red, isSelected: selectedIndex==0? true : false),
            ColorWidget(color: Colors.yellow, isSelected: selectedIndex==1? true : false),
            ColorWidget(color: Colors.green, isSelected: selectedIndex==2 ? true : false),


            Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: ElevatedButton(
                onPressed: (){
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
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
                  child: Text(
                    selectedIndex==-1 ? 'Start' : 'Stop',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
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


