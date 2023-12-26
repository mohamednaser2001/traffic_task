

import '../cache/cache_helper.dart';
import '../constants/app_contstants.dart';
import '../enums/view_type.dart';


/// initialize colors values.
/// and set default value for it
///
Future<void> initTimesAndTrafficView()async{
  try {
    AppConstants.redTime = await CacheHelper.getData(key: 'red') ?? 10;
    AppConstants.yellowTime = await CacheHelper.getData(key: 'yellow') ?? 10;
    AppConstants.greenTime = await CacheHelper.getData(key: 'green') ?? 10;


    bool isGroup= await CacheHelper.getData(key: 'trafficIsGroup') ?? true;
    AppConstants.trafficViewType = isGroup ? TrafficViewType.inGroup : TrafficViewType.fullScreen;

  } catch (e) {
    AppConstants.redTime = 10;
    AppConstants.yellowTime = 10;
    AppConstants.greenTime = 10;
    AppConstants.trafficViewType = TrafficViewType.inGroup;

  }
}