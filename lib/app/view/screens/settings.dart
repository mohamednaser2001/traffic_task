

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_light/helper/constants/app_contstants.dart';
import 'package:traffic_light/helper/enums/view_type.dart';
import 'package:traffic_light/app/view/widgets/text_form_field.dart';

import '../../controllers/app_cubit/app_cubit.dart';


class SettingsScreen  extends StatelessWidget {

  TextEditingController redController= TextEditingController();
  TextEditingController yellowController= TextEditingController();
  TextEditingController greenController= TextEditingController();
  static final _key= GlobalKey<FormState>();



  void initControllers(){
    redController.text= AppConstants.redTime.toString();
    yellowController.text= AppConstants.yellowTime.toString();
    greenController.text= AppConstants.greenTime.toString();
  }


  @override
  Widget build(BuildContext context) {
    initControllers();

    Size size= MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: SettingsScreen._key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Red Time',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                          controller: redController,
                          withBorder: true,
                          verticalPadding: 10.h,
                          radius: 6,
                          inputType: TextInputType.number,
                          enabledBorderColor: Colors.deepPurple.withOpacity(0.5),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter the time';
                            }
                            return null;
                          },
                          context: context,

                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Yellow Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                            controller: yellowController,
                            withBorder: true,
                            verticalPadding: 10.h,
                            radius: 6,
                            inputType: TextInputType.number,
                            enabledBorderColor: Colors.deepPurple.withOpacity(0.5),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter the time';
                              }
                              return null;
                            },
                            context: context,

                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Green Time',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                          controller: greenController,
                          withBorder: true,
                          verticalPadding: 10.h,
                          radius: 6,
                          inputType: TextInputType.number,
                          enabledBorderColor: Colors.deepPurple.withOpacity(0.5),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter the time';
                            }
                            return null;
                          },
                          context: context,

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                Text(
                  'Traffic View Type :',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),

                BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state){},
                  builder: (context, state) {
                    AppCubit cubit= AppCubit().get(context);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: TrafficViewType.inGroup,
                                groupValue: cubit.trafficViewType,
                                onChanged: (value){
                                  cubit.changeTrafficViewType(value!);
                                }
                            ),
                            Text(
                              'In one screen',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: TrafficViewType.fullScreen,
                                groupValue: cubit.trafficViewType,
                                onChanged: (value){
                                  cubit.changeTrafficViewType(value!);
                                }
                            ),
                            Text(
                              'Each color in screen',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                ),

                SizedBox(height: size.height*0.1,),

                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: size.width*0.5,
                    child: ElevatedButton(
                      onPressed: () async{
                        if(SettingsScreen._key.currentState!.validate()){

                            await AppCubit().get(context).saveData(
                                redValue: redController.text,
                                yellowValue: yellowController.text,
                                greenValue: greenController.text

                            ).then((value) {
                              showSnackBar('Times saved successfully',Colors.green, context);

                            }).catchError((error){
                              showSnackBar('Error, please try again',Colors.red, context);
                            });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// loading indicator.
                BlocConsumer<AppCubit, AppStates>(
                    listener: (context, state){},
                    builder: (context, state) {
                    return state is SaveTimesLoadingState? Padding(
                      padding: EdgeInsets.only(top: 4.0.h),
                      child: SizedBox(
                          width: size.width*0.5,
                          child: const LinearProgressIndicator()),
                    ) : const SizedBox();
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String text,Color color, BuildContext context)=> ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          content: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          )));

}
