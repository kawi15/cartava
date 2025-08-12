
import 'package:cartava/database/database.dart';
import 'package:cartava/database/tables/strava_activities.dart';
import 'package:drift/drift.dart';

part 'strava_activities_dao.g.dart';

@DriftAccessor(tables: [StravaActivities])
class StravaActivitiesDao extends DatabaseAccessor<AppDatabase> with _$StravaActivitiesDaoMixin {
  StravaActivitiesDao(super.db);

  Future<List<StravaActivity>> getAllActivities() async {
    return await db.managers.stravaActivities.get();
  }

  Future<List<StravaActivity>> getVisibleActivities() async {
    return await db.managers.stravaActivities.filter((f) => f.isVisible(true)).get();
  }

  Future<void> insertActivities(List<StravaActivity> list) async {
    await db.managers.stravaActivities.bulkCreate((o) => list, mode: InsertMode.insertOrIgnore);
  }

  Future<void> changeVisibility(StravaActivity activity) async {
    var obj = await db.managers.stravaActivities.filter((f) => f.id(activity.id)).getSingle();
    obj = obj.copyWith(isVisible: true);
    await db.managers.stravaActivities.replace(obj);
  }
}