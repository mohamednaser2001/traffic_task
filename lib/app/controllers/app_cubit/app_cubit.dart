import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:traffic_light/helper/constants/app_contstants.dart';
import 'package:traffic_light/helper/enums/view_type.dart';

import '../../../helper/cache/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  AppCubit get(context)=> BlocProvider.of(context);



  void initTrafficViewType(TrafficViewType trafficViewType){
    this.trafficViewType= trafficViewType;
  }


  Future<void> saveData({
  required String redValue,
    required String yellowValue,
    required String greenValue,
})async {
    try{
      emit(SaveTimesLoadingState());
      double red = double.parse(redValue.trim());
      double yellow = double.parse(yellowValue.trim());
      double green = double.parse(greenValue.trim());

      await storeLocalValues(
          redValue: red.toInt(),
          yellowValue: yellow.toInt(),
          greenValue: green.toInt());
    }catch(e){
      emit(SaveTimesErrorState());
    }
  }


  Future<void> storeLocalValues({
    required int redValue,
    required int yellowValue,
    required int greenValue,
  })async {
    /// Local values in shared preferences.
    await CacheHelper.saveData(key: 'red', value: redValue);
    await CacheHelper.saveData(key: 'yellow', value: yellowValue);
    await CacheHelper.saveData(key: 'green', value: greenValue);
    await CacheHelper.saveData(key: 'trafficIsGroup', value: trafficViewType== TrafficViewType.inGroup? true : false);


    print(trafficViewType);
    /// Change times values.
    AppConstants.redTime= redValue;
    AppConstants.yellowTime= yellowValue;
    AppConstants.greenTime= greenValue;
    AppConstants.trafficViewType= trafficViewType;
    emit(SaveTimesSuccessState());
  }




  TrafficViewType trafficViewType= TrafficViewType.inGroup;
  void changeTrafficViewType( TrafficViewType trafficType){
    trafficViewType= trafficType;
    print(trafficViewType);
    emit(ChangeTrafficViewType());
  }





}
