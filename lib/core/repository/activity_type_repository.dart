import 'package:injectable/injectable.dart';
import 'package:legalkan/core/api/activity_type_api.dart';
import 'package:legalkan/core/models/activity_type.dart';
import 'package:legalkan/utils/my_exception.dart';

abstract class IActivityTypeRepository {

  Future<List<ActivityType>> getActivityTypes();

}

@LazySingleton(as: IActivityTypeRepository)
class ActivityTypeRepository implements IActivityTypeRepository {

  final IActivityTypeApi _activityTypeApi;

  const ActivityTypeRepository(this._activityTypeApi);

  @override
  Future<List<ActivityType>> getActivityTypes() {
    try {
      return _activityTypeApi.getActivityTypes();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

}