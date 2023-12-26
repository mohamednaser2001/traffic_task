import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_light/helper/constants/app_contstants.dart';
import 'package:traffic_light/app/view/screens/police_loght_screen.dart';
import 'package:traffic_light/app/view/screens/separated_traffic_light.dart';
import 'package:traffic_light/app/view/screens/settings.dart';

import '../../../helper/enums/view_type.dart';
import '../../../helper/methods/navigation_method.dart';
import '../../../main.dart';
import 'full_screen_traffic_light.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width*0.7,
                child: ElevatedButton(
                  onPressed: (){
                    if(AppConstants.trafficViewType == TrafficViewType.inGroup){
                      navigateTo(context, const SeparatedTrafficLightScreen());
                    }else{
                      navigateTo(context, const TrafficLightFullScreen());
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.w),
                    child: Text(
                      'Traffic Light',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.h),
                child: SizedBox(
                  width: size.width*0.7,
                  child: ElevatedButton(
                    onPressed: (){
                      navigateTo(context, PoliceLightScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        'Police Light',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: size.width*0.7,
                child: ElevatedButton(
                  onPressed: (){
                    navigateTo(context, SettingsScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
