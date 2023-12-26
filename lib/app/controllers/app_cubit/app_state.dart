part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}
class ChangeTrafficViewType extends AppStates {}

class SaveTimesLoadingState extends AppStates {}
class SaveTimesSuccessState extends AppStates {}
class SaveTimesErrorState extends AppStates {}
