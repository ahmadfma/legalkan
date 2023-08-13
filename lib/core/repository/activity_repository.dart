import 'package:injectable/injectable.dart';
import 'package:legalkan/core/api/activity_api.dart';
import 'package:legalkan/utils/my_exception.dart';
import '../models/activity_penyetaraan.dart';
import '../models/my_activity.dart';

abstract class IActivityRepository {
  Future<List<MyActivity>> getMyActivities();
  Future<MyActivity> getActivity(String activityId);
  Future<ActivityPenyetaraan> getActivityPenyetaraan(String activityId);
  Future<MyActivity> createActivity(form);
  Future<MyActivity> updateStatusActivity(int status, String activityId);
  Future<ActivityPenyetaraan> updateMatakuliahPenyetaraan(String activityId, List<String> matakuliahId);
  Future<ActivityPenyetaraan> updatePenyetaraanStatus(String activityId, int status);
}

@LazySingleton(as: IActivityRepository)
class ActivityRepository implements IActivityRepository {

  final IActivityApi _activityApi;

  const ActivityRepository(this._activityApi);

  @override
  Future<List<MyActivity>> getMyActivities() {
    try {
      return _activityApi.getMyActivities();
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<MyActivity> getActivity(String activityId) {
    try {
      return _activityApi.getActivity(activityId);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<ActivityPenyetaraan> getActivityPenyetaraan(String activityId) {
    try {
      return _activityApi.getActivityPenyetaraan(activityId);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<MyActivity> createActivity(form) {
    try {
      return _activityApi.createActivity(form);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<MyActivity> updateStatusActivity(int status, String activityId) {
    try {
      return _activityApi.updateStatusActivity(status, activityId);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<ActivityPenyetaraan> updateMatakuliahPenyetaraan(String activityId, List<String> matakuliahId) {
    try {
      return _activityApi.updateMatakuliahPenyetaraan(activityId, matakuliahId);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

  @override
  Future<ActivityPenyetaraan> updatePenyetaraanStatus(String activityId, int status) {
    try {
      return _activityApi.updatePenyetaraanStatus(activityId, status);
    } on MyException catch(e) {
      throw MyException(e.message);
    }
  }

}